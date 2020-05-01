// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'label', 'uid', 'displayName']);
  return User(
    uid: json['uid'] as String,
    photoUrl: json['photoUrl'] as String,
    displayName: json['displayName'] as String,
  )
    ..id = json['id'] as String
    ..label = json['label'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'uid': instance.uid,
      'photoUrl': instance.photoUrl,
      'displayName': instance.displayName,
    };
