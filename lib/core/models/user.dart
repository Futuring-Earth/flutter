import 'package:meta/meta.dart';

import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

import './base-model.dart';

part 'user.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
@immutable
class User extends BaseModel {
  const User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
    this.aboutMe,
    this.lastSeen
  }) : super(id: uid, label: 'User');

  @JsonKey(name: 'uid', ignore: false, required: true, defaultValue: null)
  final String uid;
  @JsonKey(name: 'email', ignore: false, required: false, defaultValue: null)
  final String email;
  @JsonKey(name: 'photoUrl', ignore: false, required: false, defaultValue: null)
  final String photoUrl;
  @JsonKey(name: 'displayName', ignore: false, required: false, defaultValue: null)
  final String displayName;
  @JsonKey(name: 'lastSeen', ignore: false, required: false, defaultValue: null)
  final DateTime lastSeen;
  @JsonKey(name: 'aboutMe', ignore: false, required: false, defaultValue: null)
  final String aboutMe;

   @override
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() { 
    //update the lastSeen value to DateTime.now().toUtc()
    return _$UserToJson(this).update('lastSeen', (value) => DateTime.now().toUtc());
  }
}
