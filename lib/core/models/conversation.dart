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
class ConversationSnippet extends BaseModel {
  const ConversationSnippet({
    @required this.id,
    this.connversationId,
    this.lastMessage,
    this.unseenCount,
    this.timestamp,
    this.name,
    this.photoUrl,
    this.type
  }) : super(id: id, label: 'ConversationSnippet');

  @JsonKey(name: 'id', ignore: false, required: true, defaultValue: null)
  final String id;
  @JsonKey(name: 'connversationId', ignore: false, required: true, defaultValue: null)
  final String connversationId;
  @JsonKey(name: 'lastMessage', ignore: false, required: false, defaultValue: null)
  final String lastMessage;
  @JsonKey(name: 'unseenCount', ignore: false, required: false, defaultValue: 0)
  final int unseenCount;
  @JsonKey(name: 'timestamp', ignore: false, required: false, defaultValue: null)
  final String timestamp;

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
    Map<String, dynamic> jsonConversationSnippet = _$ConversationSnippetToJson(this);
    jsonConversationSnippet.update('lastSeen', (value) => DateTime.now().toUtc());
    return jsonConversationSnippet;
  }
}
