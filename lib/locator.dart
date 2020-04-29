import 'package:get_it/get_it.dart';
import './services/http_service.dart';
import './services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => HttpService());
}