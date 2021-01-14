import 'package:flutter/material.dart';

// Flutter has an issue with static variables in class, hence import class file and not package
import '../../helperForSampleApp.dart';

class HomeLoginScreen extends StatefulWidget {
  HomeLoginScreen({Key key}) : super(key: key);

  @override
  _HomeLoginScreenState createState() => _HomeLoginScreenState();
}

class _HomeLoginScreenState extends State<HomeLoginScreen> {
  int _counter = 0;

  void _incrementCounter() {
    HelperForSampleApp.changeUserRole(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login Screen for not logged in user',
              ),
              Text(
                'UserRole: $_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        label: Text("Login user"),
        icon: Icon(Icons.login),
      ),
    );
  }
}
