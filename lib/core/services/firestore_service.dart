import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FirestoreService {
  Firestore _db;

  static final FirestoreService instance = FirestoreService._();

  FirestoreService._() {
    _db = Firestore.instance;
  }

  Future<String> setNewData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final collection = _db.collection(path);
    final reference = collection.document();
    //print('$path: $data');
    await reference.setData(data);
    return reference.documentID;
  }

  Future<String> setData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = _db.document(path);
    //print('$path: $data');
    await reference.setData(data);
    return reference.documentID;
  }

  Future<void> updateData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = _db.document(path);
    print('$path: $data');
    await reference.updateData(data);
  }

  Future<void> appendItemtoArray(
      {@required String path,
      @required Map<String, dynamic> data,
      @required String arrayName}) async {
    final reference = _db.document(path);
    print('$path: $data');
    await reference.updateData({
      arrayName: FieldValue.arrayUnion(
        [
          data,
        ],
      ),
    });
  }

  Future<void> deleteData({@required String path}) async {
    final reference = _db.document(path);
    print('delete: $path');
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) {
    Query query = _db.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.documents
          .map((snapshot) => builder(snapshot.data, snapshot.documentID))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
  }) {
    final DocumentReference reference = _db.document(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots
        .map((snapshot) => builder(snapshot.data, snapshot.documentID));
  }

  Future<T> documentById<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
  }) async {
    final DocumentReference reference = _db.document(path);
    final DocumentSnapshot snapshot = await reference.get();
    if (snapshot.exists) {
      return builder(snapshot.data, snapshot.documentID);
    } else {
      return null;
    }
  }
}
