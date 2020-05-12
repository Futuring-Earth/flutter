part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['uid']);
  return User(
    uid: json['uid'] as String,
    email: json['email'] as String,
    photoUrl: json['photoUrl'] as String,
    displayName: json['displayName'] as String,
    aboutMe: json['aboutMe'] as String,
    lastSeen: json['lastSeen'] == null
        ? null
        : (json['lastSeen'] as Timestamp).toDate(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'displayName': instance.displayName,
      'lastSeen': instance.lastSeen?.toIso8601String(),
      'aboutMe': instance.aboutMe,
    };
