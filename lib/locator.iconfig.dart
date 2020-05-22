// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:app/core/services/cloud_storage_service.dart';
import 'package:app/core/services/third_party_services_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:app/core/services/http_based/http_service.dart';
import 'package:app/core/services/image_picker_service.dart';
import 'package:app/core/services/snackbar_service.dart';
import 'package:app/core/services/user_handler.dart';
import 'package:app/core/models/user.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<CloudStorageService>(() => CloudStorageService());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<HttpService>(() => HttpService());
  g.registerLazySingleton<ImagePickerService>(() => ImagePickerService());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<SnackBarService>(() => SnackBarService());
  g.registerLazySingleton<UserHandler>(
      () => UserHandler(currentUser: g<User>()));
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
