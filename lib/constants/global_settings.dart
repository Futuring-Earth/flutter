class Constants {
  static const String firebaseProjectURL =
      'https://sharedkarma.firebaseapp.com/';
}

class APIPath {
  static String challenge(String uid, String objectId) =>
      'users/$uid/challenges/$objectId';
  static String challenges(String uid) => 'users/$uid/challenges';
  static String user(String uid) => 'users/$uid';
  static String users() => 'users';
  static String conversationSnippet(String uid, String objectId) =>
      'users/$uid/conversations/$objectId';
  static String conversationSnippets(String uid) => 'users/$uid/conversations';
  static String conversation(String objectId) => 'conversations/$objectId';
  static String conversations() => 'conversations';
}
