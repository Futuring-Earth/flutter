part of 'message.dart';

Message _$MessageFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['senderId']);
  return Message(
    senderId: json['senderId'] as String,
    content: json['v'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : (json['timestamp'] as Timestamp).toDate(),
    type: _$enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'senderId': instance.senderId,
      'v': instance.content,
      'timestamp': instance.timestamp?.toIso8601String(),
      'type': _$MessageTypeEnumMap[instance.type],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$MessageTypeEnumMap = {
  MessageType.Text: 'Text',
  MessageType.Image: 'Image',
};
