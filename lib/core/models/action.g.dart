// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['title', 'description', 'id']);
  return Action(
    title: json['title'] as String,
    description: json['description'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
    };
