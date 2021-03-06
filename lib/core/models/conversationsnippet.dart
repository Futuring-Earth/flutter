import 'package:app/core/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

import './base-model.dart';

part 'conversationsnippet.static.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
// @  ---- JsonSerializable(explicitToJson: true)
// Disable the auto Generation of the partial class to be
// able to cast the firebase timestamp datatype into a DateTime
// timestamp: json['timestamp'] == null
//         ? null
//         : (json['timestamp'] as Timestamp).toDate(),
//
@immutable
class ConversationSnippet extends BaseModel {
  const ConversationSnippet(
      {@required this.id,
      this.connversationId,
      this.lastMessage,
      this.unseenCount,
      this.timestamp,
      this.name,
      this.photoUrl,
      this.type})
      : super(id: id, label: 'ConversationSnippet');

  @JsonKey(name: 'id', ignore: false, required: true, defaultValue: null)
  final String id;
  @JsonKey(
      name: 'connversationId',
      ignore: false,
      required: true,
      defaultValue: null)
  final String connversationId;
  @JsonKey(
      name: 'lastMessage', ignore: false, required: false, defaultValue: null)
  final String lastMessage;
  @JsonKey(name: 'unseenCount', ignore: false, required: false, defaultValue: 0)
  final int unseenCount;
  @JsonKey(
      name: 'timestamp', ignore: false, required: false, defaultValue: null)
  final DateTime timestamp;

  @JsonKey(name: 'name', ignore: false, required: false, defaultValue: null)
  final String name;
  @JsonKey(name: 'photoUrl', ignore: false, required: false, defaultValue: null)
  final String photoUrl;
  @JsonKey(name: 'type', ignore: false, required: false, defaultValue: null)
  final MessageType type;

  @override
  factory ConversationSnippet.fromJson(Map<String, dynamic> json) =>
      _$ConversationSnippetFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    //update the lastSeen value to DateTime.now().toUtc()
    Map<String, dynamic> jsonConversationSnippet =
        _$ConversationSnippetToJson(this);
    return jsonConversationSnippet;
  }
}
