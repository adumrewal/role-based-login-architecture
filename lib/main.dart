import 'package:flutter/material.dart';
import 'package:flutter_login_architecture/app/loginManager.dart';
import 'package:flutter_login_architecture/app/routes.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';
import 'package:tuple/tuple.dart';

// Flutter has an issue with static variables in class, hence import class file and not package
import 'helperForSampleApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // Initialise loginManager
  // This will take care of your user profile and roles
  LoginManager loginManager = new LoginManager();
  await loginManager.init();
  // Using a static variable to access instance from anywhere
  HelperForSampleApp.loginManager = loginManager;

  // Sailor helps you control navigation easily
  Routes.createRoutes();

  runApp(MyApp(loginManager));
}

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  final LoginManager loginManager;
  MyApp(this.loginManager);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Material app gets rebuilt when login switch happens
    // Set login ChangeNotifierProvider here since you do not want user to
    // have access to other/previously existing views when there is a change.
    // If you want to have access to the view the user came from, put the change
    // notifier provider inside your material app on some widget

    return ChangeNotifierProvider.value(
      value: widget.loginManager,
      child: Selector<LoginManager, Tuple2<bool, int>>(
        selector: (_, loginManager) =>
            Tuple2(loginManager.isUserLoggedIn, loginManager.userRole),
        builder: (BuildContext context, loginManagerData, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Login Architecture',
            onGenerateRoute: Routes.sailor.generator(),
            navigatorKey: Routes.sailor.navigatorKey,
            theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            navigatorObservers: [
              SailorLoggingObserver(),
              Routes.sailor.navigationStackObserver,
            ],
            initialRoute: "/",
          );
        },
      ),
    );
  }
}
