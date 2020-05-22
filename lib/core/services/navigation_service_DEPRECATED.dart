// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class NavigationService {
//   GlobalKey<NavigatorState> navigatorKey;

//   static NavigationService instance = NavigationService();

//   NavigationService() {
//     navigatorKey = GlobalKey<NavigatorState>();
//   }

//   Future<dynamic> pushReplacementNamed(String _routeName) {
//     return navigatorKey.currentState.pushReplacementNamed(_routeName);
//   }

//   Future<dynamic> navigateTo(String _routeName) {
//     return navigatorKey.currentState.pushNamed(_routeName);
//   }

//   Future<dynamic> push(MaterialPageRoute _route) {
//     return navigatorKey.currentState.push(_route);
//   }

//   Future<dynamic> pushNamed(String _route, {Object arguments}) {
//     return navigatorKey.currentState.pushNamed(_route, arguments: arguments);
//   }

//   void goBack({bool popAll = false}) {
//     return navigatorKey.currentState.pop(popAll);
//   }
// }
