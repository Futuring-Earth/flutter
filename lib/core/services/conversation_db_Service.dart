import 'dart:async';

import 'package:app/constants/global_settings.dart';
import 'package:app/core/models/conversation.dart';
import 'package:app/core/models/message.dart';
import 'package:app/core/services/firestore_service.dart';
import 'package:meta/meta.dart';

abstract class ConversationDBService {
  Future<void> setConversation(Conversation conversation);
  Future<void> sendMessage(String conversationId, Message message);
  Future<void> deleteConversation(Conversation conversation);
  Stream<List<Conversation>> conversationsStream();
  Stream<Conversation> conversationStream({@required String conversationId});
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreConversationDBService implements ConversationDBService {
  // FirestoreConversationDBService({@required this.uid}) : assert(uid != null);
  // final String uid;
  // final _service = FirestoreService.instance;
  FirestoreService _service;

  static final FirestoreConversationDBService instance =
      FirestoreConversationDBService._();

  FirestoreConversationDBService._() {
    _service = FirestoreService.instance;
  }

  @override
  Future<String> setConversation(Conversation conversation) async =>
      await _service.setData(
        path: APIPath.conversations(),
        data: conversation.toJson(),
      );

  @override
  Future<void> sendMessage(String conversationId, Message message) async {
    var _messageType = "";
    switch (message.type) {
      case MessageType.Text:
        _messageType = "text";
        break;
      case MessageType.Image:
        _messageType = "image";
        break;
      default:
    }

    Map<String, dynamic> newMessage = {
      "message": message.content,
      "senderID": message.senderId,
      "timestamp": message.timestamp,
      "type": _messageType,
    };

    await _service.appendItemtoArray(
        path: APIPath.conversations(), data: newMessage, arrayName: "messages");
  }

  @override
  Future<void> deleteConversation(Conversation conversation) async {
    await _service.deleteData(path: APIPath.conversation(conversation.id));
  }

  @override
  Stream<Conversation> conversationStream({@required String conversationId}) =>
      _service.documentStream(
        path: APIPath.conversation(conversationId),
        builder: (data, documentId) =>
            Conversation.fromJson(data), //, documentId),
      );

  @override
  Stream<List<Conversation>> conversationsStream() => _service.collectionStream(
        path: APIPath.conversations(),
        builder: (data, documentId) =>
            Conversation.fromJson(data), //, documentId),
      );

  Future<void> createOrGetConversartion(String _currentID, String _recepientID,
      Future<void> _onSuccess(String _conversationID)) async {
    try {
      final Conversation conversationInDb =
          await _service.documentById<Conversation>(
        path: APIPath.conversationsByUser(_currentID),
        builder: (data, documentId) =>
            Conversation.fromJson(data), //, documentId),
      );

      if (conversationInDb != null) {
        return _onSuccess(conversationInDb.id);
      } else {
        Conversation newConversation = Conversation.fromJson({
          "members": [_currentID, _recepientID],
          "ownerID": _currentID,
          'messages': [],
        });

        String documentId = await setConversation(newConversation);

        return _onSuccess(documentId);
      }
    } catch (e) {
      print(e);
    }
    return;
  }
}
