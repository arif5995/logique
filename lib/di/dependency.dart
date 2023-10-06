import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logique/config/local/database/database_module.dart';
import 'package:logique/config/network/dio_handler.dart';
import 'package:logique/controller/network/network_controller.dart';
import 'package:logique/utils/navigation/navigation_helper.dart';
import 'package:logique/utils/navigation/router/home_router.dart';

final sl = GetIt.instance;

class Dependency {
  Future<void> initialize() async {
    sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
    sl.registerLazySingleton<DioHandler>(() => DioHandler(
          apiBaseUrl: '',
        ));

    sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
    _registerController();
    _navigation();
    _routers();
  }

  void _registerController() {
    sl.registerLazySingleton<NetworkController>(() => NetworkControllerImpl(dio: sl()));
  }

  void _navigation() => sl.registerLazySingleton<NavigationHelper>(
        () => NavigationHelperImpl(),
  );

  void _routers(){
    sl.registerLazySingleton<HomeRouter>(() => HomeRouterImpl(navigationHelper: sl()));
  }
}
