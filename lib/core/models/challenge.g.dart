// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'title',
    'description',
    'minTeamSize',
    'maxTeamSize',
    'co2Impact',
    'overallRaiting',
    'id'
  ]);
  return Challenge(
    title: json['title'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    duration: json['duration'] as int,
    minTeamSize: json['minTeamSize'] as int,
    maxTeamSize: json['maxTeamSize'] as int,
    co2Impact: (json['co2Impact'] as num)?.toDouble(),
    overallRaiting: (json['overallRaiting'] as num)?.toDouble(),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'duration': instance.duration,
      'minTeamSize': instance.minTeamSize,
      'maxTeamSize': instance.maxTeamSize,
      'co2Impact': instance.co2Impact,
      'overallRaiting': instance.overallRaiting,
      'id': instance.id,
    };
