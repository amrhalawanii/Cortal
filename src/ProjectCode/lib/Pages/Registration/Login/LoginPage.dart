import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Registration/Login/LoginForm.dart';
import 'package:cortal/UI_Elements/Background.dart';
import 'package:cortal/UI_Elements/MiddleLine.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void setState(VoidCallback fn) {
    Device.height = MediaQuery.of(context).size.height;
    Device.width = MediaQuery.of(context).size.width;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      Device.height = MediaQuery.of(context).size.height;
      Device.width = MediaQuery.of(context).size.width;
    });
    return Scaffold(
      backgroundColor: ConstantColors.accentGrey,
      body: BackgroundWithNoCard(
          child: LayoutBuilder(builder: (context, constraints) {
        Device.height = MediaQuery.of(context).size.height;
        Device.width = MediaQuery.of(context).size.width;
        if (constraints.maxWidth < kDesktopBreakPoint) {
          //Mobile App Size
          return LoginPageWeb();
        } else {
          //Website
          return LoginPageWeb();
        }
      })),
    );
  }
}

class LoginPageWeb extends StatelessWidget {
  const LoginPageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Device.height! * 0.9,
        width: Device.width! * 0.48,
        // color: Colors.blue,
        child: Center(
          child: SingleChildScrollView(
            child: LayoutBuilder(builder: (context, constraints) {
              isPhone = constraints.maxWidth < kTabletBreakPoint;
              return Container(
                height: Device.height! * 0.6,
                width: Device.width! * 0.48,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: isPhone!
                                ? Device.width! * 0.1
                                : Device.width! * 0.02,
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
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LoginForm()
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
