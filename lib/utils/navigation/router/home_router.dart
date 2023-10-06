
import 'package:logique/utils/navigation/navigation_helper.dart';
import 'package:logique/utils/navigation/router/app_router.dart';

abstract class HomeRouter {

  void goBack({String? arguments});

  void navigateToDetailHome({int? idUser});
}

class HomeRouterImpl implements HomeRouter {
  final NavigationHelper navigationHelper;

  HomeRouterImpl({required this.navigationHelper});

  @override
  void goBack({String? arguments}) {
    navigationHelper.pop(arguments);
  }

  @override
  void navigateToDetailHome({int? idUser}) {
    navigationHelper.pushNamedAndRemoveUntil(AppRouter.homeDetail, arguments: idUser ?? 0);
  }

}
