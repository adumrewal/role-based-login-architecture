import 'package:flutter/material.dart';

// Flutter has an issue with static variables in class, hence import class file and not package
import '../../helperForSampleApp.dart';

class HomePageUserRoleTwo extends StatefulWidget {
  HomePageUserRoleTwo({Key key}) : super(key: key);

  @override
  _HomePageUserRoleTwoState createState() => _HomePageUserRoleTwoState();
}

class _HomePageUserRoleTwoState extends State<HomePageUserRoleTwo> {
  int _counter = 2;

  void _incrementCounter() {
    HelperForSampleApp.changeUserRole(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Portal"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home screen for user role student',
            ),
            Text(
              'UserRole: $_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        label: Text("Logout user"),
        icon: Icon(Icons.exit_to_app),
      ),
    );
  }
}
