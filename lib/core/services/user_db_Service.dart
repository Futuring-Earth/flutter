import 'dart:async';

import 'package:app/constants/global_settings.dart';
import 'package:app/core/models/user.dart';
import 'package:app/core/services/firestore_service.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

abstract class UserDBService {
  Future<void> setUser(User user);
  Future<void> deleteUser(User user);
  Stream<List<User>> usersStream({String searchText});
  Stream<User> userStream({@required String userId});
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

@lazySingleton
class FirestoreUserDBService implements UserDBService {
  // FirestoreUserDBService({@required this.uid}) : assert(uid != null);
  // final String uid;
  // final _service = FirestoreService.instance;
  FirestoreService _service;

  static final FirestoreUserDBService instance = FirestoreUserDBService._();

  FirestoreUserDBService._() {
    _service = FirestoreService.instance;
  }

  @override
  Future<void> setUser(User user) async => await _service.setData(
        path: APIPath.user(user.id),
        data: user.toJson(),
      );

  @override
  Future<void> deleteUser(User user) async {
    await _service.deleteData(path: APIPath.user(user.id));
  }

  @override
  Stream<User> userStream({@required String userId}) => _service.documentStream(
        path: APIPath.user(userId),
        builder: (data, documentId) => User.fromJson(data), //, documentId),
      );

  @override
  Stream<List<User>> usersStream({String searchText}) =>
      _service.collectionStream(
        path: APIPath.users(),
        builder: (data, documentId) => User.fromJson(data), //, documentId),
        queryBuilder: (searchText != null && searchText != '')
            ? (query) => query
                .where('displayName', isGreaterThanOrEqualTo: searchText)
                .where(query, isLessThan: searchText + 'z')
            : null,
        sort: (lhs, rhs) {
          if (lhs.displayName == null) return -1;
          if (rhs.displayName == null) return 1;
          return rhs.displayName.compareTo(lhs.displayName);
        },
      );
}
