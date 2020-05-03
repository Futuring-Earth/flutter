class Constants {
  static const String firebaseProjectURL =
      'https://sharedkarma.firebaseapp.com/';
}

class APIPath {
  static String challenge(String uid, String jobId) =>
      'users/$uid/challenges/$jobId';
  static String challenges(String uid) => 'users/$uid/challenges';
}
