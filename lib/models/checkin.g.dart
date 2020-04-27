// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkin _$CheckinFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'checkinDate',
    'challengeID',
    'userID',
    'unitsAchived',
    'unitType',
    'id',
    'label'
  ]);
  return Checkin(
    checkinDate: json['checkinDate'] == null
        ? null
        : DateTime.parse(json['checkinDate'] as String),
    challengeID: json['challengeID'] as String,
    userID: json['userID'] as String,
    id: json['id'] as String,
    unitsAchived: (json['unitsAchived'] as num)?.toDouble(),
    unitType: json['unitType'] as String,
    label: json['label'],
  );
}

Map<String, dynamic> _$CheckinToJson(Checkin instance) => <String, dynamic>{
      'checkinDate': instance.checkinDate?.toIso8601String(),
      'challengeID': instance.challengeID,
      'userID': instance.userID,
      'unitsAchived': instance.unitsAchived,
      'unitType': instance.unitType,
      'id': instance.id,
      'label': instance.label,
    };
