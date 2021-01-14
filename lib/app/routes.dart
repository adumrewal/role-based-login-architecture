import 'package:flutter_login_architecture/app/home/homeLoginScreen.dart';
import 'package:flutter_login_architecture/app/home/homePageNavigator.dart';
import 'package:flutter_login_architecture/app/home/homePageUserRoleOne.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor(
    options: SailorOptions(handleNameNotFoundUI: true, isLoggingEnabled: true),
  );

  static void createRoutes() async {
    sailor.addRoutes([
      SailorRoute(
        name: "/",
        builder: (context, args, params) {
          return HomePageNavigatorScreen();
        },
      ),
      SailorRoute(
        name: "loginScreenRoute",
        builder: (context, args, params) {
          return HomeLoginScreen();
        },
      ),
      SailorRoute(
        name: "homeUserRoleOneRoute",
        builder: (context, args, params) {
          return HomePageUserRoleOne();
        },
      ),
      SailorRoute(
        name: "homeUserRoleTwoRoute",
        builder: (context, args, params) {
          return HomePageUserRoleOne();
        },
      )
    ]);
  }
}
