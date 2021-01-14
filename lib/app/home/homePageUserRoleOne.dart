import 'package:flutter/material.dart';

// Flutter has an issue with static variables in class, hence import class file and not package
import '../../helperForSampleApp.dart';

class HomePageUserRoleOne extends StatefulWidget {
  HomePageUserRoleOne({Key key}) : super(key: key);

  @override
  _HomePageUserRoleOneState createState() => _HomePageUserRoleOneState();
}

class _HomePageUserRoleOneState extends State<HomePageUserRoleOne> {
  int _counter = 1;

  void _incrementCounter() {
    HelperForSampleApp.changeUserRole(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text("Admin Portal"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home screen for user role Admin',
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
        label: Text("Switch to Student"),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
