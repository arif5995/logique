import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logique/di/dependency.dart';
import 'package:logique/presentation/home/bloc/home_bloc.dart';
import 'package:logique/presentation/home/ui/bottom_navigation.dart';
import 'package:logique/presentation/home/ui/detail_home.dart';
import 'package:logique/utils/navigation/navigation_helper.dart';
import 'package:logique/utils/navigation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dependency().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
          create: (context) => HomeBloc(networkController: sl())
            ..add(HomeLoaded())
            ..add(HomeOnTab(index: 0)),
          child: BottomNavigation(),
        ),
        navigatorKey: NavigationHelperImpl.navigationKey,
        onGenerateRoute: (RouteSettings settings) {
          final argument = settings.arguments;
          switch (settings.name) {
            case AppRouter.home:
              return MaterialPageRoute(
                  builder: (_) => BlocProvider(
                        create: (context) => HomeBloc(networkController: sl())
                          ..add(HomeLoaded())
                          ..add(HomeOnTab(index: 0)),
                        child: BottomNavigation(),
                      ));
            case AppRouter.homeDetail:
              return MaterialPageRoute(
                  builder: (_) => BlocProvider(
                        create: (context) => HomeBloc(networkController: sl())
                          ..add(HomeUserDetail(idUser: argument as String))
                          ..add(HomeListPost(idUser: argument)),
                        child: HomeDetail(),
                      ));
          }
        });
  }
}
