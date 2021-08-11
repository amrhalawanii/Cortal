import 'dart:async';

import 'package:cortal/Configuration/SharedPreferencesMethods.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Helpers/ShowMessage.dart';
import 'package:cortal/Pages/Portal/AdminPanel/AdminPanel.dart';
import 'package:cortal/Pages/Portal/AllComplaintsPage.dart';
import 'package:cortal/Pages/Registration/Login/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      ///--------------------------------------------------------------
      ///-------------------- Set device dimensions -------------------
      ///--------------------------------------------------------------
      setState(() {
        Device.height = MediaQuery.of(context).size.height;
        Device.width = MediaQuery.of(context).size.width;
      });
      // bool isAdmin;
      // await SharedPreferencesMethods.getIsUserLoggedIn().then((v) async {
      //   if (v) {
      //     isAdmin = SharedPreferencesMethods.getIsAdmin();
      //     if (isAdmin) {
      //       Navigator.pushReplacement(context,
      //           MaterialPageRoute(builder: (context) => AdminPanelPage()));
      //     } else {
      //       Navigator.pushReplacement(context,
      //           MaterialPageRoute(builder: (context) => AllComplaintsPage()));
      //     }
      //   } else {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => LoginPage()));
      //   }
      // });

      // FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
      //   if (user == null) {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => LoginPage()));
      //   } else {
      //     //! Get User Info
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => AllComplaintsPage()));
      //   }
      // }).onError((e) {
      //   ShowMessage().showErrorDialog(context, "ERROR", e.toString());
      // });

      await SharedPreferencesMethods.getIsAdmin().then((v) {
        if (activeIsAdmin == "NONE") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else if (activeIsAdmin == "USER") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AllComplaintsPage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AdminPanelPage()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.accentGrey,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ConstantImages.pwcLogo,
            height: 150,
          ),
          const SizedBox(
            height: 50,
          ),
          SpinKitCubeGrid(
            color: ConstantColors.primaryRed,
            size: 30.0,
          )
        ],
      )),
    );
  }
}
