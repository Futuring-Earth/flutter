import 'dart:async';

import 'package:app/constants/global_settings.dart';
import 'package:app/core/models/challenge.dart';
import 'package:app/core/services/firestore_service.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
abstract class ChallengeDBService {
  Future<void> setChallenge(Challenge challenge);
  Future<void> deleteChallenge(Challenge challenge);
  Stream<List<Challenge>> challengesStream();
  Stream<Challenge> challengeStream({@required String challengeId});
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreChallengeDBService implements ChallengeDBService {
  FirestoreChallengeDBService({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> setChallenge(Challenge challenge) async =>
      await _service.setData(
        path: APIPath.challenge(uid, challenge.id),
        data: challenge.toJson(),
      );

  @override
  Future<void> deleteChallenge(Challenge challenge) async {
    // // delete where entry.challengeId == challenge.challengeId
    // final allEntries = await entriesStream(challenge: challenge).first;
    // for (Entry entry in allEntries) {
    //   if (entry.challengeId == challenge.id) {
    //     await deleteEntry(entry);
    //   }
    // }
    // delete challenge
    await _service.deleteData(path: APIPath.challenge(uid, challenge.id));
  }

  @override
  Stream<Challenge> challengeStream({@required String challengeId}) =>
      _service.documentStream(
        path: APIPath.challenge(uid, challengeId),
        builder: (data, documentId) =>
            Challenge.fromJson(data), //, documentId),
      );

  @override
  Stream<List<Challenge>> challengesStream() => _service.collectionStream(
        path: APIPath.challenges(uid),
        builder: (data, documentId) =>
            Challenge.fromJson(data), //, documentId),
      );
}
