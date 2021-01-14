# Login and User Role Architecture in Flutter
**Efficient state management and navigation for apps with specific home screens for various user roles.**

Many times when working on an app we come across the following scenario:
- How does one control navigation and state management in the app wrt login/logout/user-role
- Every app requires a separate screen for logged in users vs not logged in users
- Also, if your app has multiple user roles, like Admin, Student, Teacher, Staff, it becomes very cumbersome to manage which view to show for each user and how to ensure one user type does not have access to outside information

Here in this repository I have provided a very simple structure for the app to ensure when there is a change in user state, the app gets updated automatically.

## Screenshots

|Login Screen|Admin Home|Student Home|
|:-:|:-:|:-:|
|<img width="250" alt="login-screen" src="https://github.com/adumrewal/login-user-role-architecture/raw/main/assets/LoginScreen.png"> | <img width="250" alt="admin-portal" src="https://github.com/adumrewal/login-user-role-architecture/raw/main/assets/AdminPortal.png"> |<img width="250" alt="student-portal" src="https://github.com/adumrewal/login-user-role-architecture/raw/main/assets/StudentPortal.png"> |

Suppose you are in the login screen and press the login button. In this case the user should be navigated inside the app and we should pop the login screen from the app. Adding if the user is an Admin types, he should be shown screen 2 vs screen 3 or X for other user roles.

Now for a logged in user, when they logout, the entire state of the app should be refreshed and a login screen should be shown. (i.e. They should not have access to previously shown information)

The relevant files are available inside the lib folder. main.dart, routes.dart, loginManager.dart and homePageNavigator.dart are the main files required to create an efficient login structure. Others are just helpers to create a sample app.

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

I use VSCode for running flutter applications. It is very efficient and works like a charm.

Open the project folder in VSCode and click on run. Your sample app will get launched.
