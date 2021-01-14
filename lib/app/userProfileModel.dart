class UserProfile {
  String firstName;
  String lastName;
  int userRole;

  UserProfile({this.firstName, this.lastName, this.userRole});

  factory UserProfile.fromJson(Map<String, dynamic> userJson) {
    return UserProfile(
      firstName: userJson["first_name"],
      lastName: userJson["last_name"],
      userRole: userJson["role"],
    );
  }
}
