// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversationsnippet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationSnippet _$ConversationSnippetFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'connversationId']);
  return ConversationSnippet(
    id: json['id'] as String,
    connversationId: json['connversationId'] as String,
    lastMessage: json['lastMessage'] as String,
    unseenCount: json['unseenCount'] as int ?? 0,
    timestamp: json['timestamp'] == null
        ? null
        : (json['timestamp'] as Timestamp).toDate(),
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
    type: _$enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$ConversationSnippetToJson(
        ConversationSnippet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'connversationId': instance.connversationId,
      'lastMessage': instance.lastMessage,
      'unseenCount': instance.unseenCount,
      'timestamp': instance.timestamp?.toIso8601String(),
      'name': instance.name,
      'photoUrl': instance.photoUrl,
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
