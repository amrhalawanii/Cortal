import 'package:cortal/Configuration/auth.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Portal/AllComplaintsPage.dart';
import 'package:cortal/Pages/Registration/Signup/SignUpPage.dart';
import 'package:cortal/UI_Elements/Circular_progrss.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "";
  String _password = "";

  bool _obsecurePassword = true;

  ///=============================| To Check if all textfields are valid |=============================
  checkFields() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      return true;
    }
    return false;
  }

  ///=============================| Submit Form and login |=============================
  _submitLoginForm() async {
    FocusScope.of(context).unfocus();

    if (checkFields()) {
      setState(() {
        _isLoading = true;
      });

      if (_email != "admin") {
        await authServices().signIn(context, _email, _password).then((c) {
          setState(() {
            _isLoading = false;
          });
        });
      } else {
        //! Log in As An Admin
        await authServices().signInAdmin(context, _password).then((v) {
          setState(() {
            _isLoading = false;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        isPhone = constraints.maxWidth < kTabletBreakPoint;
        return Container(
          width: isPhone! ? Device.width! * 0.9 : Device.width! * 0.4,
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///--------------------------------------------------------------------------------
                    ///---------------------------------- Email Textfield  ----------------------------
                    ///--------------------------------------------------------------------------------
                    TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: ConstantColors.navyBlue,
                        ),
                        labelText: 'Email Addrss',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: ConstantColors.navyBlue),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ConstantColors.navyBlue),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ConstantColors.navyBlue),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ConstantColors.navyBlue)),
                      ),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Can't be empty";
                        }
                      },
                      onSaved: (email) {
                        setState(() {
                          _email = email!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    ///--------------------------------------------------------------------------------
                    ///----------------------------- Password Textfield  ------------------------------
                    ///--------------------------------------------------------------------------------
                    TextFormField(
                      obscureText: _obsecurePassword,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: ConstantColors.navyBlue,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: ConstantColors.navyBlue),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ConstantColors.navyBlue),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ConstantColors.navyBlue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ConstantColors.navyBlue)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obsecurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ConstantColors.navyBlue,
                            ),
                            onPressed: () {
                              setState(() {
                                _obsecurePassword = !_obsecurePassword;
                              });
                            },
                          )),
                      validator: (pass) {
                        if (pass!.length < 6)
                          return "Must be atleast 6 letters ";
                      },
                      onSaved: (pass) {
                        setState(() {
                          _password = pass!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    ///! To be done late if there was extra time
                    ///--------------------------------------------------------------------------------
                    ///--------------------------- Forgot Password Button  ----------------------------
                    ///--------------------------------------------------------------------------------
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: InkWell(
                    //     mouseCursor: SystemMouseCursors.click,
                    //     onTap: () {
                    //       // Navigator.of(context).push(
                    //       //   MaterialPageRoute(
                    //       //       builder: (context) => ResetPasswordPage()),
                    //       // );
                    //     },
                    //     child: Text(
                    //       "Forgot Password",
                    //       style: TextStyle(
                    //           color: ConstantColors.primaryRed,
                    //           fontSize: 14,
                    //           fontFamily: 'Trueno',
                    //           fontWeight: FontWeight.w700,
                    //           decoration: TextDecoration.underline),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 25.0),

                    ///--------------------------------------------------------------------------------
                    ///---------------------------------- Login Button  --------------------------------
                    ///--------------------------------------------------------------------------------
                    _isLoading
                        ? ShowCircularProgressIndicator()
                        : Container(
                            width: isPhone!
                                ? Device.width! * 0.7
                                : Device.width! * 0.30,
                            height: 45,
                            child: FlatButton(
                              height: 70,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              color: ConstantColors.navyBlue,
                              child: Text("NEXT",
                                  style: GoogleFonts.lato(color: Colors.white)),
                              onPressed: () {
                                _submitLoginForm();
                              },
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),

                    ///--------------------------------------------------------------------------------
                    ///---------------------------------- Dont Have An Account  -----------------------
                    ///--------------------------------------------------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",
                            style: TextStyle(
                              color: ConstantColors.navyBlue,
                              fontSize: isPhone! ? 14 : Device.width! * 0.01,
                            )),
                        InkWell(
                          mouseCursor: SystemMouseCursors.click,
                          onTap: () {
                            //! Go To SignUp Page
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                          },
                          child: Text("Register",
                              style: TextStyle(
                                  color: ConstantColors.primaryRed,
                                  fontSize:
                                      isPhone! ? 14 : Device.width! * 0.01,
                                  fontFamily: 'Trueno',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
