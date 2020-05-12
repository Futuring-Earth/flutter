import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

import './base-model.dart';

part 'message.static.dart';

enum MessageType {
  Text,
  Image,
}

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
// @ --- JsonSerializable(explicitToJson: true)
// Disable the auto Generation of the partial class to be
// able to cast the firebase timestamp datatype into a DateTime
// timestamp: json['timestamp'] == null
//         ? null
//         : (json['timestamp'] as Timestamp).toDate(),
@immutable
class Message extends BaseModel {
  const Message({
    @required this.senderId,
    this.content,
    this.timestamp,
    this.type,
  }) : super(id: senderId, label: 'Message');

  @JsonKey(name: 'senderId', ignore: false, required: true, defaultValue: null)
  final String senderId;
  @JsonKey(name: 'v', ignore: false, required: false, defaultValue: null)
  final String content;
  @JsonKey(
      name: 'timestamp', ignore: false, required: false, defaultValue: null)
  final DateTime timestamp;
  @JsonKey(name: 'type', ignore: false, required: false, defaultValue: null)
  final MessageType type;

  @override
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    //update the lastSeen value to DateTime.now().toUtc()
    Map<String, dynamic> jsonMessage = _$MessageToJson(this);
    jsonMessage.update('lastSeen', (value) => DateTime.now().toUtc());
    return jsonMessage;
  }
}
