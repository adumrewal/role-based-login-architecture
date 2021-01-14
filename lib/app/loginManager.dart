import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'userProfileModel.dart';

class LoginManager with ChangeNotifier {
  User firebaseUser;
  bool isUserLoggedIn = false;
  int userRole = 0;
  // variable starting with _ means private variable
  UserProfile _currentUserProfile;

  LoginManager() {
    setPropertiesForNullUser();
  }

  Future<void> init() async {
    // Fetch current user from firebase authentication service
    // You need to setup the app on firebase first
    // User user = FirebaseAuth.instance.currentUser;

    // This should be fetched from sharedPref for pre-existing users
    // shouldNotify should be false when called during app init
    // await updateUser(user, shouldNotify: false);
  }

  Future<void> updateUser(User user, {bool shouldNotify: true}) async {
    if (user == null) {
      setPropertiesForNullUser();
    } else {
      UserProfile profile = await fetchProfileForFirebaseUser(user.uid);
      if (profile == null)
        setPropertiesForNullUser();
      else
        setPropertiesForLoggedInUser(user, profile);
    }
    if (shouldNotify) notifyListeners();
  }

  setPropertiesForNullUser() {
    this.firebaseUser = null;
    this.isUserLoggedIn = false;
    this.userRole = 0;
    this._currentUserProfile = null;

    // Remove the notifyListeners here once you start using firebase and updateUser function
    notifyListeners();
  }

  setPropertiesForLoggedInUser(User user, UserProfile profile) {
    this.firebaseUser = user;
    this.isUserLoggedIn = true;
    this.userRole = profile.userRole;
    this._currentUserProfile = profile;

    // Remove the notifyListeners here once you start using firebase and updateUser function
    notifyListeners();
  }

  Future<UserProfile> fetchProfileForFirebaseUser(String fbuid) async {
    // Make an OAuth call to confirm the credentials and register user on server
    // OAuth call should also provide access and refresh tokens
    // The tokens get stored as shared instance during app runtime

    // bool isLoggedIn = await oAuthLogin(fbuid);
    // if (!isLoggedIn) return null;

    // If user is successfully logged in, fetch their profile from server
    // Make a user data model (here userProfile) and store user details

    // UserProfile profile = await fetchMyUserProfile();
    // return profile;

    return null;
  }

  // External callers can use this to access logged in user's profile
  UserProfile getUser() {
    return this._currentUserProfile;
  }
}
