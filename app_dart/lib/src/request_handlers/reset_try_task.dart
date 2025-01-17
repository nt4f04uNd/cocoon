// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:github/github.dart';
import 'package:meta/meta.dart';

import '../../cocoon_service.dart';
import '../request_handling/api_request_handler.dart';
import '../request_handling/exceptions.dart';

/// Runs all the applicable tasks for a given PR and commit hash. This will be
/// used to unblock rollers when creating a new commit is not possible.
@immutable
class ResetTryTask extends ApiRequestHandler<Body> {
  const ResetTryTask(
    Config config,
    AuthenticationProvider authenticationProvider,
    this.scheduler,
  ) : super(config: config, authenticationProvider: authenticationProvider);

  final Scheduler scheduler;

  @override
  Future<Body> get() async {
    final String owner = request!.uri.queryParameters['owner'] ?? 'flutter';
    final String repo = request!.uri.queryParameters['repo'] ?? '';
    final String pr = request!.uri.queryParameters['pr'] ?? '';
    final String commitSha = request!.uri.queryParameters['commitSha'] ?? '';

    final int? prNumber = int.tryParse(pr);
    if (prNumber == null) {
      throw const BadRequestException('pr must be a number');
    }
    final RepositorySlug slug = RepositorySlug(owner, repo);
    final GitHub github = await config.createGitHubClient(slug);
    final PullRequest pullRequest = await github.pullRequests.get(slug, prNumber);
    await scheduler.triggerPresubmitTargets(
        branch: pullRequest.base!.ref!, prNumber: prNumber, commitSha: commitSha, slug: slug);
    return Body.empty;
  }
}
