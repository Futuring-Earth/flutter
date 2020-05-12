import 'dart:async';

import 'package:app/constants/global_settings.dart';
import 'package:app/core/models/conversationsnippet.dart';
import 'package:app/core/services/firestore_service.dart';
import 'package:meta/meta.dart';

abstract class ConversationSnippetDBService {
  Future<void> setConversationSnippet(
      String userId, ConversationSnippet conversationSnippet);
  Future<void> deleteConversationSnippet(
      String userId, ConversationSnippet conversationSnippet);
  Stream<List<ConversationSnippet>> conversationSnippetsStream(String userId);
  Stream<ConversationSnippet> conversationSnippetStream(
      {@required String userId, @required String conversationSnippetId});
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreConversationSnippetDBService
    implements ConversationSnippetDBService {
  // FirestoreConversationSnippetDBService({@required this.uid}) : assert(uid != null);
  // final String uid;
  // final _service = FirestoreService.instance;
  FirestoreService _service;

  static final FirestoreConversationSnippetDBService instance =
      FirestoreConversationSnippetDBService._();

  FirestoreConversationSnippetDBService._() {
    _service = FirestoreService.instance;
  }

  @override
  Future<void> setConversationSnippet(
          String userId, ConversationSnippet conversationSnippet) async =>
      await _service.setData(
        path: APIPath.conversationSnippets(userId),
        data: conversationSnippet.toJson(),
      );

  @override
  Future<void> deleteConversationSnippet(
      String userId, ConversationSnippet conversationSnippet) async {
    await _service.deleteData(
        path: APIPath.conversationSnippet(
            userId, conversationSnippet.connversationId));
  }

  @override
  Stream<ConversationSnippet> conversationSnippetStream(
          {@required String userId, @required String conversationSnippetId}) =>
      _service.documentStream(
        path: APIPath.conversationSnippet(userId, conversationSnippetId),
        builder: (data, documentId) =>
            ConversationSnippet.fromJson(data), //, documentId),
      );

  @override
  Stream<List<ConversationSnippet>> conversationSnippetsStream(String userId) =>
      _service.collectionStream(
        path: APIPath.conversationSnippets(userId),
        builder: (data, documentId) =>
            ConversationSnippet.fromJson(data), //, documentId),
      );
}
