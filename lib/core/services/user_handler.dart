import 'package:app/constants/global_settings.dart';
import 'package:app/core/models/user.dart';
import 'package:app/core/services/firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHandler {
  UserHandler({
    this.currentUser
  }) ;
  final User currentUser;

  static UserHandler create({
    User currentUser,
  }) {
    final userHandler = UserHandler(
      currentUser: currentUser);
      checkUserInDB(currentUser);
    return userHandler;
  }

  static void checkUserInDB(User user) async
  {
  final _service = FirestoreService.instance;
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();

  if (user != null) {
      // Check is already sign up
    final User userInDb = await _service.documentById<User>(path: APIPath.user(user.uid),
        builder: (data, documentId) =>
            User.fromJson(data), //, documentId),
      );
      if (userInDb == null) {
        // Update data to server if new user
        await _service.setData(path: APIPath.user(user.uid), data: user.toJson());

        await prefs.setString('id', user.uid);
        await prefs.setString('displayName', user.displayName);
        await prefs.setString('photoUrl', user.photoUrl);
      }
      else
      {
        await prefs.setString('id', userInDb.uid);
        await prefs.setString('displayName', userInDb.displayName);
        await prefs.setString('photoUrl', userInDb.photoUrl);
        await prefs.setString('aboutMe', userInDb.aboutMe);
      }
    }
  }
}