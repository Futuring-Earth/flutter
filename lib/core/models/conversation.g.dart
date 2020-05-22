// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['members', 'messages', 'ownerID']);
  return Conversation(
    id: json['id'] as String,
    members: json['members'] as List,
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ownerID: json['ownerID'] as String,
  );
}

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
      'messages': instance.messages?.map((e) => e?.toJson())?.toList(),
      'ownerID': instance.ownerID,
    };
