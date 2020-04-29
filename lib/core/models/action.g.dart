// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'label', 'title', 'description']);
  return Action(
    title: json['title'] as String,
    description: json['description'] as String,
  )
    ..id = json['id'] as String
    ..label = json['label'] as String;
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'title': instance.title,
      'description': instance.description,
    };
