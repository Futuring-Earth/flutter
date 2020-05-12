import 'package:app/core/models/message.dart';
import 'package:meta/meta.dart';

import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

import './base-model.dart';

part 'conversation.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
@immutable
class Conversation extends BaseModel {
  const Conversation(
      {@required this.id, this.members, this.messages, this.ownerID})
      : super(id: id, label: 'Conversation');

  @JsonKey(name: 'id', ignore: false, required: true, defaultValue: null)
  final String id;
  @JsonKey(name: 'members', ignore: false, required: true, defaultValue: null)
  final List members;
  @JsonKey(name: 'messages', ignore: false, required: true, defaultValue: null)
  final List<Message> messages;
  @JsonKey(name: 'ownerID', ignore: false, required: true, defaultValue: null)
  final String ownerID;

  @override
  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    //update the lastSeen value to DateTime.now().toUtc()
    Map<String, dynamic> jsonConversation = _$ConversationToJson(this);
    jsonConversation.update('lastSeen', (value) => DateTime.now().toUtc());
    return jsonConversation;
  }
}
