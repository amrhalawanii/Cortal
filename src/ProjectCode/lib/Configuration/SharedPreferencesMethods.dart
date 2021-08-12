import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesMethods {
  ///---------------------------------------------------------------------
  ///-----------------------| Shared Preferences Keys |-------------------
  ///---------------------------------------------------------------------
  static String userID = "USERID";
  static String userEmail = "EMAIL";
  static String isAdmin = "NONE";

  ///---------------------------------------------------------------------
  ///-----------------------| Save & get if user is admin |---------------
  ///---------------------------------------------------------------------
  static saveIsAdmin(String ia) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(isAdmin, ia);
  }

  static getIsAdmin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    activeIsAdmin = await preferences.getString(isAdmin);
  }

  ///---------------------------------------------------------------------
  ///---------------------------| Save & get user info |------------------
  ///---------------------------------------------------------------------
  static saveUserSharedPreferences(CortalUser user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      await preferences.setString(userEmail, user.email);
      await preferences.setString(userID, user.userId);
    } catch (e) {
      print("Error + " + e.toString());
    }
  }

  static getUserSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    CortalUser user;

    try {
      user = CortalUser(
        preferences.getString(userID)!,
        preferences.getString(userEmail)!,
      );

      activeUser = user;
    } catch (e) {
      print("Error + " + e.toString());
    }
  }

  ///---------------------------------------------------------------------
  ///----------------------| Clear Shared Preferences |-------------------
  ///---------------------------------------------------------------------
  static clearSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userID, "USERID");
    await preferences.setString(userEmail, "EMAIL");
    await preferences.setString(isAdmin, "NONE");
  }
}
