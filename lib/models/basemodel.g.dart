// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'label']);
  return BaseModel(
    id: json['id'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };
