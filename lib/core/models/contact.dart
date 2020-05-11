import 'package:meta/meta.dart';

import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

import './base-model.dart';

part 'contact.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
@immutable
class Contact extends BaseModel {
  const Contact({
    @required this.id,
    this.email,
    this.photoUrl,
    this.displayName,
    this.lastSeen
  }) : super(id: id, label: 'Contact');

  @JsonKey(name: 'id', ignore: false, required: true, defaultValue: null)
  final String id;
  @JsonKey(name: 'email', ignore: false, required: false, defaultValue: null)
  final String email;
  @JsonKey(name: 'photoUrl', ignore: false, required: false, defaultValue: null)
  final String photoUrl;
  @JsonKey(name: 'displayName', ignore: false, required: false, defaultValue: null)
  final String displayName;
  @JsonKey(name: 'lastSeen', ignore: false, required: false, defaultValue: null)
  final String lastSeen;

   @override
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  @override
  Map<String, dynamic> toJson() { 
    //update the lastSeen value to DateTime.now().toUtc()
    Map<String, dynamic> jsonContact = _$ContactToJson(this);
    jsonContact.update('lastSeen', (value) => DateTime.now().toUtc());
    return jsonContact;
  }
}
