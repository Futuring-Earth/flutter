import 'package:get_it/get_it.dart';
import './core/services/http_based/http_service.dart';
import './core/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //I can now ask the navigation service defined in the MaterialApp inside the main.dart
  //by calling navigatorKey.currentState... (All the methods of the NavigationService class)
  locator.registerLazySingleton(() => NavigationService.instance);
  locator.registerLazySingleton(() => HttpService());
}
