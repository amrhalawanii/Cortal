import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Registration/Login/LoginForm.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      Device.height = MediaQuery.of(context).size.height;
      Device.width = MediaQuery.of(context).size.width;
    });
    return Scaffold(
      backgroundColor: ConstantColors.accentGrey,
      body: BackgroundWithNoCard(child: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            isPhone = constraints.maxWidth < kTabletBreakPoint;
            return Container(
              height: Device.height! * 0.6,
              width: isPhone! ? Device.width! * 0.9 : Device.width! * 0.48,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///--------------------------------------------------------------------------------
                  ///---------------------------------- Login Label  --------------------------------
                  ///--------------------------------------------------------------------------------
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          fontSize: isPhone!
                              ? Device.width! * 0.1
                              : Device.width! * 0.045,
                          color: ConstantColors.navyBlue,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              color: const Color(0x29000000),
                              offset: Offset(-5, 5),
                              blurRadius: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///--------------------------------------------------------------------------------
                  ///---------------------------------- Login Form  ---------------------------------
                  ///--------------------------------------------------------------------------------
                  LoginForm()
                ],
              ),
            );
          }),
        ),
      )),
    );
  }
}
