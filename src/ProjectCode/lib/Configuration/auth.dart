import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortal/Configuration/SharedPreferencesMethods.dart';
import 'package:cortal/Configuration/User.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Helpers/ShowMessage.dart';
import 'package:cortal/Pages/Portal/AdminPanel/AdminPanel.dart';
import 'package:cortal/Pages/Portal/AllComplaintsPage.dart';
import 'package:cortal/Pages/Registration/Login/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class authServices {
  //------------------------------------------------------------------------------------------------
  //----------------------------------- Create Account Function ------------------------------------
  //------------------------------------------------------------------------------------------------
  createAccount(BuildContext context, String email, String password,
      String gender) async {
    //=================================| Create User Account On Firebase |==================================
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((firebaseUser) async {
      print("Account Created !");

      //=================================| Store New User info On Firebase |==================================
      await FirebaseFirestore.instance
          .collection("user")
          .doc(firebaseUser.user!.uid)
          .set({
        "userId": firebaseUser.user!.uid,
        "email": email,
        "Gender": gender,
      });

      //=================================| Sign New User In |==================================

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        CortalUser user = CortalUser(value.user!.uid, email);
        SharedPreferencesMethods.saveUserSharedPreferences(user);
        SharedPreferencesMethods.saveIsAdmin("USER");

        activeUser = user;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AllComplaintsPage()));
      });
    }).catchError((e, stackTrace) {
      switch (e.code.toString()) {
        case 'weak-password':
          ShowMessage().showErrorDialog(
              context, "Weak Password", "The password provided is too weak.");
          break;
        case 'email-already-in-use':
          ShowMessage().showErrorDialog(context, "Invalid Email",
              "The account already exists for that email.");
          break;
        default:
          ShowMessage()
              .showErrorDialog(context, "Error", "${e.message.toString()}");
      }
    });
  }

  //------------------------------------------------------------------------------------------------
  //---------------------------------------- Sign In Function --------------------------------------
  //------------------------------------------------------------------------------------------------

  signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CortalUser user = CortalUser(value.user!.uid, email);
      SharedPreferencesMethods.saveUserSharedPreferences(user);

      SharedPreferencesMethods.saveIsAdmin("USER");
      activeUser = user;

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AllComplaintsPage()));
    }).catchError((e, stackTrace) {
      switch (e.code.toString()) {
        case 'user-not-found':
          ShowMessage().showErrorDialog(context, "Invalid Email",
              "No user found for that email & password.");
          break;
        case 'wrong-password':
          ShowMessage().showErrorDialog(context, "Invalid Password",
              "Wrong password provided for that user.");
          break;
        default:
          ShowMessage()
              .showErrorDialog(context, "Error", "${e.message.toString()}");
      }
    });
  }

  //------------------------------------------------------------------------------------------------
  //---------------------------------------- Sign In As Admin --------------------------------------
  //------------------------------------------------------------------------------------------------
  signInAdmin(BuildContext context, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: "admin@cortal.com", password: password)
        .then((value) {
      CortalUser user = CortalUser(value.user!.uid, "admin@cortal.com");
      SharedPreferencesMethods.saveUserSharedPreferences(user);
      SharedPreferencesMethods.saveIsAdmin("ADMIN");

      activeUser = user;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminPanelPage()));
    }).catchError((e) {
      ShowMessage().showErrorDialog(context, "Error", e.toString());
    });
  }

  //------------------------------------------------------------------------------------------------
  //---------------------------------------- SignOut Function ----------------------------------------
  //--------------------------------------------------------------------------------------------------

}
