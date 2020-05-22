import 'package:app/ui/views/activity/activity_view.dart';
import 'package:app/ui/views/challenges/challenges_view.dart';
import 'package:app/ui/views/challenges/edit_challenge_view.dart';
import 'package:app/ui/views/chat/recent_conversationSnippets_view.dart';
import 'package:app/ui/views/chat/search_page.dart';
import 'package:app/ui/views/home_view.dart';
import 'package:app/ui/views/inspiration/inspiration_view.dart';
import 'package:app/ui/views/profile/profile_view.dart';
import 'package:app/ui/views/settings/settings_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeViewRoute;
  ProfileView profileViewRoute;
  ActivityView activityViewRoute;
  InspirationView inspirationViewRoute;
  ChallengesView challengesViewRoute;
  SettingsView settingsViewRoute;
  EditChallengesView editChallengesViewRoute;
  RecentConversationSnippetsView recentConversationSnippetsViewRoute;
  SearchPage searchPageRoute;
}
