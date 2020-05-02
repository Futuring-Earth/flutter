import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

import './base-model.dart';

//To automatically build the part classes
// flutter pub run build_runner build (one time build)
// flutter pub run build_runner watch (continuous build)
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends BaseModel {
  @JsonKey(name: 'uid', ignore: false, required: true, defaultValue: null)
  final String uid;
  @JsonKey(name: 'photoUrl', ignore: false, required: false, defaultValue: null)
  final String photoUrl;
  @JsonKey(
      name: 'displayName', ignore: false, required: true, defaultValue: null)
  final String displayName;
  @JsonKey(name: 'token', ignore: false, required: false, defaultValue: null)
  final String token;
  @JsonKey(name: 'userId', ignore: false, required: false, defaultValue: null)
  final String userId;
  @JsonKey(
      name: 'expiration', ignore: false, required: false, defaultValue: null)
  final DateTime expiration;

  User(
      {@required this.uid,
      @required this.photoUrl,
      @required this.displayName,
      this.token,
      this.userId,
      this.expiration});

  @override
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
