// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:github/github.dart';

import '../foundation/utils.dart';
import '../model/appengine/commit.dart';
import '../model/luci/push_message.dart';
import 'config.dart';
import 'luci.dart';
import 'scheduler.dart';

/// Github status api pending state constant.
const String PENDING_STATE = 'pending';

class GithubStatusService {
  const GithubStatusService(this.config, this.scheduler);

  /// The global configuration of this AppEngine server.
  final Config config;
  final Scheduler scheduler;

  Future<void> setBuildsPendingStatus(
    int prNumber,
    String commitSha,
    RepositorySlug slug,
  ) async {
    final GitHub gitHubClient = await config.createGitHubClient(slug);
    final Commit presubmitCommit = Commit(repository: slug.fullName, sha: commitSha);
    final List<LuciBuilder> presubmitBuilders =
        await scheduler.getPresubmitBuilders(commit: presubmitCommit, prNumber: prNumber);
    for (LuciBuilder builder in presubmitBuilders) {
      final CreateStatus status = CreateStatus(PENDING_STATE)
        ..context = builder.name
        ..description = 'Flutter LUCI Build: ${builder.name}'
        ..targetUrl = '';
      await gitHubClient.repositories.createStatus(slug, commitSha, status);
    }
  }

  Future<bool> setPendingStatus({
    required String ref,
    required String builderName,
    required String buildUrl,
    required RepositorySlug slug,
  }) async {
    // No builderName configuration, nothing to do here.
    if (await repoNameForBuilder((await config.luciBuilders('try', slug))!, builderName) == null) {
      return false;
    }
    final GitHub gitHubClient = await config.createGitHubClient(slug);
    // GitHub "only" allows setting a status for a context/ref pair 1000 times.
    // We should avoid unnecessarily setting a pending status, e.g. if we get
    // started and pending messages close together.
    // We have to check for both because sometimes one or the other might come
    // in.
    // However, we should keep going if the _most recent_ status is not pending.
    await for (RepositoryStatus status in gitHubClient.repositories.listStatuses(slug, ref)) {
      if (status.context == builderName) {
        if (status.state == PENDING_STATE && status.targetUrl!.startsWith(buildUrl)) {
          return false;
        }
        break;
      }
    }

    String updatedBuildUrl = '';
    if (buildUrl.isNotEmpty) {
      // If buildUrl is not empty then append a query parameter to refresh the page
      // content every 30 seconds. A resulting updatedBuild url will look like:
      // https://ci.chromium.org/p/flutter/builders/try/Linux%20Web%20Engine/5275?reload=30
      updatedBuildUrl = '$buildUrl${buildUrl.contains('?') ? '&' : '?'}reload=30';
    }
    final CreateStatus status = CreateStatus(PENDING_STATE)
      ..context = builderName
      ..description = 'Flutter LUCI Build: $builderName'
      ..targetUrl = updatedBuildUrl;
    await gitHubClient.repositories.createStatus(slug, ref, status);
    return true;
  }

  Future<bool> setCompletedStatus({
    required String ref,
    required String builderName,
    required String buildUrl,
    required Result result,
    required RepositorySlug slug,
  }) async {
    // No builderName configuration, nothing to do here.
    if (await repoNameForBuilder((await config.luciBuilders('try', slug))!, builderName) == null) {
      return false;
    }
    final GitHub gitHubClient = await config.createGitHubClient(slug);
    final CreateStatus status = statusForResult(result)
      ..context = builderName
      ..description = 'Flutter LUCI Build: $builderName'
      ..targetUrl = buildUrl;
    await gitHubClient.repositories.createStatus(slug, ref, status);
    return true;
  }

  CreateStatus statusForResult(Result result) {
    switch (result) {
      case Result.canceled:
      case Result.failure:
        return CreateStatus('failure');
      case Result.success:
        return CreateStatus('success');
    }
  }
}
