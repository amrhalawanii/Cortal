import 'dart:async';

import 'package:cortal/Configuration/SharedPreferencesMethods.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Portal/AdminPanel/AdminPanel.dart';
import 'package:cortal/Pages/Portal/AllComplaintsPage.dart';
import 'package:cortal/Pages/Registration/Login/LoginPage.dart';
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

      ///------------------| Check if user already logged in & if admin or not |------------------
      await SharedPreferencesMethods.getIsAdmin().then((v) async {
        await SharedPreferencesMethods.getUserSharedPreferences();
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
          ///------------------| PWC Logo |------------------

          Image.asset(
            ConstantImages.pwcLogo,
            height: 150,
          ),
          const SizedBox(
            height: 50,
          ),

          ///------------------| Loading Indicator |------------------
          SpinKitCubeGrid(
            color: ConstantColors.primaryRed,
            size: 30.0,
          )
        ],
      )),
    );
  }
}
