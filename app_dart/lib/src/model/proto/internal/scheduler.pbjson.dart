///
//  Generated code. Do not modify.
//  source: lib/src/model/proto/internal/scheduler.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use schedulerSystemDescriptor instead')
const SchedulerSystem$json = {
  '1': 'SchedulerSystem',
  '2': [
    {'1': 'cocoon', '2': 1},
    {'1': 'luci', '2': 2},
    {'1': 'google_internal', '2': 3},
  ],
};

/// Descriptor for `SchedulerSystem`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List schedulerSystemDescriptor =
    $convert.base64Decode('Cg9TY2hlZHVsZXJTeXN0ZW0SCgoGY29jb29uEAESCAoEbHVjaRACEhMKD2dvb2dsZV9pbnRlcm5hbBAD');
@$core.Deprecated('Use schedulerConfigDescriptor instead')
const SchedulerConfig$json = {
  '1': 'SchedulerConfig',
  '2': [
    {'1': 'targets', '3': 1, '4': 3, '5': 11, '6': '.scheduler.Target', '10': 'targets'},
    {'1': 'enabled_branches', '3': 2, '4': 3, '5': 9, '10': 'enabledBranches'},
    {
      '1': 'platform_properties',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.scheduler.SchedulerConfig.PlatformPropertiesEntry',
      '10': 'platformProperties'
    },
  ],
  '3': [SchedulerConfig_PlatformPropertiesEntry$json, SchedulerConfig_Properties$json],
};

@$core.Deprecated('Use schedulerConfigDescriptor instead')
const SchedulerConfig_PlatformPropertiesEntry$json = {
  '1': 'PlatformPropertiesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.scheduler.SchedulerConfig.Properties', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use schedulerConfigDescriptor instead')
const SchedulerConfig_Properties$json = {
  '1': 'Properties',
  '2': [
    {
      '1': 'properties',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.scheduler.SchedulerConfig.Properties.PropertiesEntry',
      '10': 'properties'
    },
  ],
  '3': [SchedulerConfig_Properties_PropertiesEntry$json],
};

@$core.Deprecated('Use schedulerConfigDescriptor instead')
const SchedulerConfig_Properties_PropertiesEntry$json = {
  '1': 'PropertiesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SchedulerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List schedulerConfigDescriptor = $convert.base64Decode(
    'Cg9TY2hlZHVsZXJDb25maWcSKwoHdGFyZ2V0cxgBIAMoCzIRLnNjaGVkdWxlci5UYXJnZXRSB3RhcmdldHMSKQoQZW5hYmxlZF9icmFuY2hlcxgCIAMoCVIPZW5hYmxlZEJyYW5jaGVzEmMKE3BsYXRmb3JtX3Byb3BlcnRpZXMYAyADKAsyMi5zY2hlZHVsZXIuU2NoZWR1bGVyQ29uZmlnLlBsYXRmb3JtUHJvcGVydGllc0VudHJ5UhJwbGF0Zm9ybVByb3BlcnRpZXMabAoXUGxhdGZvcm1Qcm9wZXJ0aWVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSOwoFdmFsdWUYAiABKAsyJS5zY2hlZHVsZXIuU2NoZWR1bGVyQ29uZmlnLlByb3BlcnRpZXNSBXZhbHVlOgI4ARqiAQoKUHJvcGVydGllcxJVCgpwcm9wZXJ0aWVzGAEgAygLMjUuc2NoZWR1bGVyLlNjaGVkdWxlckNvbmZpZy5Qcm9wZXJ0aWVzLlByb3BlcnRpZXNFbnRyeVIKcHJvcGVydGllcxo9Cg9Qcm9wZXJ0aWVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use targetDescriptor instead')
const Target$json = {
  '1': 'Target',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'dependencies', '3': 2, '4': 3, '5': 9, '10': 'dependencies'},
    {'1': 'bringup', '3': 3, '4': 1, '5': 8, '7': 'false', '10': 'bringup'},
    {'1': 'timeout', '3': 4, '4': 1, '5': 5, '7': '30', '10': 'timeout'},
    {'1': 'testbed', '3': 5, '4': 1, '5': 9, '7': 'linux-vm', '10': 'testbed'},
    {'1': 'properties', '3': 6, '4': 3, '5': 11, '6': '.scheduler.Target.PropertiesEntry', '10': 'properties'},
    {
      '1': 'builder',
      '3': 7,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'builder',
    },
    {'1': 'scheduler', '3': 8, '4': 1, '5': 14, '6': '.scheduler.SchedulerSystem', '7': 'cocoon', '10': 'scheduler'},
    {'1': 'presubmit', '3': 9, '4': 1, '5': 8, '7': 'true', '10': 'presubmit'},
    {'1': 'postsubmit', '3': 10, '4': 1, '5': 8, '7': 'true', '10': 'postsubmit'},
    {'1': 'run_if', '3': 11, '4': 3, '5': 9, '10': 'runIf'},
    {'1': 'enabled_branches', '3': 12, '4': 3, '5': 9, '10': 'enabledBranches'},
    {'1': 'recipe', '3': 13, '4': 1, '5': 9, '10': 'recipe'},
  ],
  '3': [Target_PropertiesEntry$json],
  '9': [
    {'1': 14, '2': 15},
  ],
};

@$core.Deprecated('Use targetDescriptor instead')
const Target_PropertiesEntry$json = {
  '1': 'PropertiesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Target`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List targetDescriptor = $convert.base64Decode(
    'CgZUYXJnZXQSEgoEbmFtZRgBIAEoCVIEbmFtZRIiCgxkZXBlbmRlbmNpZXMYAiADKAlSDGRlcGVuZGVuY2llcxIfCgdicmluZ3VwGAMgASgIOgVmYWxzZVIHYnJpbmd1cBIcCgd0aW1lb3V0GAQgASgFOgIzMFIHdGltZW91dBIiCgd0ZXN0YmVkGAUgASgJOghsaW51eC12bVIHdGVzdGJlZBJBCgpwcm9wZXJ0aWVzGAYgAygLMiEuc2NoZWR1bGVyLlRhcmdldC5Qcm9wZXJ0aWVzRW50cnlSCnByb3BlcnRpZXMSHAoHYnVpbGRlchgHIAEoCUICGAFSB2J1aWxkZXISQAoJc2NoZWR1bGVyGAggASgOMhouc2NoZWR1bGVyLlNjaGVkdWxlclN5c3RlbToGY29jb29uUglzY2hlZHVsZXISIgoJcHJlc3VibWl0GAkgASgIOgR0cnVlUglwcmVzdWJtaXQSJAoKcG9zdHN1Ym1pdBgKIAEoCDoEdHJ1ZVIKcG9zdHN1Ym1pdBIVCgZydW5faWYYCyADKAlSBXJ1bklmEikKEGVuYWJsZWRfYnJhbmNoZXMYDCADKAlSD2VuYWJsZWRCcmFuY2hlcxIWCgZyZWNpcGUYDSABKAlSBnJlY2lwZRo9Cg9Qcm9wZXJ0aWVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUoECA4QDw==');
