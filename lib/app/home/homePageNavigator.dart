import 'package:flutter/material.dart';
import 'package:flutter_login_architecture/app/home/homeLoginScreen.dart';
import 'package:flutter_login_architecture/app/loginManager.dart';
import 'package:flutter_login_architecture/app/home/homePageUserRoleOne.dart';
import 'package:flutter_login_architecture/app/home/homePageUserRoleTwo.dart';
import 'package:provider/provider.dart';

class HomePageNavigatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch provider in tree of type LoginManager
    // Another way is to use the static class and fetch login manager
    LoginManager loginManager =
        Provider.of<LoginManager>(context, listen: false);

    if (!loginManager.isUserLoggedIn) return HomeLoginScreen();
    if (loginManager.userRole == 1) return HomePageUserRoleOne();
    if (loginManager.userRole == 2) return HomePageUserRoleTwo();
    return HomeLoginScreen();
  }
}
