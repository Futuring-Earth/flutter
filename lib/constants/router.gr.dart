// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/ui/views/home_view.dart';
import 'package:app/core/models/user.dart';
import 'package:app/ui/views/profile/profile_view.dart';
import 'package:app/ui/views/activity/activity_view.dart';
import 'package:app/ui/views/inspiration/inspiration_view.dart';
import 'package:app/ui/views/challenges/challenges_view.dart';
import 'package:app/ui/views/settings/settings_view.dart';
import 'package:app/ui/views/challenges/edit_challenge_view.dart';
import 'package:app/ui/views/chat/recent_conversationSnippets_view.dart';
import 'package:app/ui/views/chat/search_page.dart';

abstract class Routes {
  static const homeViewRoute = '/';
  static const profileViewRoute = '/profile-view-route';
  static const activityViewRoute = '/activity-view-route';
  static const inspirationViewRoute = '/inspiration-view-route';
  static const challengesViewRoute = '/challenges-view-route';
  static const settingsViewRoute = '/settings-view-route';
  static const editChallengesViewRoute = '/edit-challenges-view-route';
  static const recentConversationSnippetsViewRoute =
      '/recent-conversation-snippets-view-route';
  static const searchPageRoute = '/search-page-route';
  static const all = {
    homeViewRoute,
    profileViewRoute,
    activityViewRoute,
    inspirationViewRoute,
    challengesViewRoute,
    settingsViewRoute,
    editChallengesViewRoute,
    recentConversationSnippetsViewRoute,
    searchPageRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeViewRoute:
        if (hasInvalidArgs<HomeViewArguments>(args)) {
          return misTypedArgsRoute<HomeViewArguments>(args);
        }
        final typedArgs = args as HomeViewArguments ?? HomeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(
              userSnapshot: typedArgs.userSnapshot, key: typedArgs.key),
          settings: settings,
        );
      case Routes.profileViewRoute:
        if (hasInvalidArgs<ProfileViewArguments>(args)) {
          return misTypedArgsRoute<ProfileViewArguments>(args);
        }
        final typedArgs =
            args as ProfileViewArguments ?? ProfileViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ProfileView(user: typedArgs.user),
          settings: settings,
        );
      case Routes.activityViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ActivityView(),
          settings: settings,
        );
      case Routes.inspirationViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => InspirationView(),
          settings: settings,
        );
      case Routes.challengesViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChallengesView(),
          settings: settings,
        );
      case Routes.settingsViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingsView(),
          settings: settings,
        );
      case Routes.editChallengesViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => EditChallengesView(),
          settings: settings,
        );
      case Routes.recentConversationSnippetsViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => RecentConversationSnippetsView(),
          settings: settings,
        );
      case Routes.searchPageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SearchPage(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//HomeView arguments holder class
class HomeViewArguments {
  final AsyncSnapshot<User> userSnapshot;
  final Key key;
  HomeViewArguments({this.userSnapshot, this.key});
}

//ProfileView arguments holder class
class ProfileViewArguments {
  final User user;
  ProfileViewArguments({this.user});
}
