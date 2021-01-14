import 'package:flutter_login_architecture/app/loginManager.dart';
import 'package:flutter_login_architecture/app/userProfileModel.dart';

// This class is mostly a hardcoding to ensure you are able to see a demo
// It tries to send the data which you would ideally expect from the server
// and updates your login manager with it
class HelperForSampleApp {
  static LoginManager loginManager;

  static void changeUserRole(int currentRole) {
    int newRole = (currentRole + 1) % 3;

    if (newRole == 0) {
      loginManager.setPropertiesForNullUser();
      return;
    }
    Map<String, dynamic> userJson = {
      "first_name": "Amol",
      "last_name": "D",
      "role": newRole
    };
    UserProfile newUserProfile = UserProfile.fromJson(userJson);

    // You should not ideally call this method/ pass null to it.
    // When firebase is setup, use updateUser function and pass firebase user
    // Let that function handle fetching the details from the server
    loginManager.setPropertiesForLoggedInUser(null, newUserProfile);
  }
}
