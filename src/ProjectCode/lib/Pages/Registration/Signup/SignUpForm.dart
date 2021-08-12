import 'package:cortal/Configuration/auth.dart';
import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Registration/Login/LoginPage.dart';
import 'package:cortal/UI_Elements/Circular_progrss.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

enum Gender { male, female, other }

class _SignUpFormState extends State<SignUpForm> {
  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey();
  Gender? _gender = Gender.other;

  String _email = "";
  String _password = "";
  bool _obsecurePassword = true;
  String _userGender = "other";

  final _passwordController = TextEditingController();

  ///------------------| Check if all fields are valid |------------------
  checkFields() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      return true;
    }
    return false;
  }

  ///------------------| Subit form & Sign Up  |------------------
  _submitSignUpForm() async {
    FocusScope.of(context).unfocus();

    if (checkFields()) {
      setState(() {
        _isLoading = true;
      });

      /// Sets Gender
      if (_gender == Gender.male) {
        setState(() {
          _userGender = "male";
        });
      } else if (_gender == Gender.female) {
        setState(() {
          _userGender = "female";
        });
      }

      ///------------------| Create Account Function |------------------
      await authServices()
          .createAccount(context, _email, _password, _userGender);
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
                    ///----------------------------- Email Addresss -----------------------------------
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
                    ///----------------------------- Select Gender ------------------------------------
                    ///--------------------------------------------------------------------------------
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: ConstantColors.navyBlue,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Gender: ",
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ConstantColors.navyBlue),
                        ),
                        SizedBox(
                          width: 20,
                        ),

                        ///--------------------------------------------------------------------------------
                        ///----------------------------- Female -----------------------------------
                        ///--------------------------------------------------------------------------------
                        Row(
                          children: [
                            Radio<Gender>(
                              value: Gender.female,
                              fillColor: MaterialStateProperty.all(
                                  ConstantColors.primaryRed),
                              groupValue: _gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                            Text(
                              "Female",
                              style: GoogleFonts.lato(
                                  color: ConstantColors.navyBlue,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),

                        ///--------------------------------------------------------------------------------
                        ///----------------------------- Male  --------------------------------------------
                        ///--------------------------------------------------------------------------------
                        Row(
                          children: [
                            Radio<Gender>(
                              value: Gender.male,
                              fillColor: MaterialStateProperty.all(
                                  ConstantColors.primaryRed),
                              groupValue: _gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                            Text(
                              "Male",
                              style: GoogleFonts.lato(
                                  color: ConstantColors.navyBlue,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),

                        ///--------------------------------------------------------------------------------
                        ///----------------------------- Other --------------------------------------------
                        ///--------------------------------------------------------------------------------
                        Row(
                          children: [
                            Radio<Gender>(
                              value: Gender.other,
                              fillColor: MaterialStateProperty.all(
                                  ConstantColors.primaryRed),
                              groupValue: _gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                            Text(
                              "Rather not say",
                              style: GoogleFonts.lato(
                                  color: ConstantColors.navyBlue,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    ///--------------------------------------------------------------------------------
                    ///--------------------------------- Password  ------------------------------------
                    ///--------------------------------------------------------------------------------
                    TextFormField(
                      obscureText: _obsecurePassword,
                      controller: _passwordController,
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
                    SizedBox(
                      height: 20,
                    ),

                    ///--------------------------------------------------------------------------------
                    ///------------------------------ Confirmation Password  -------------------------
                    ///--------------------------------------------------------------------------------
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: ConstantColors.navyBlue,
                        ),
                        labelText: 'Confirmation Password',
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
                      validator: (pass) {
                        if (pass!.length < 6)
                          return "Must be atleast 6 letters ";
                        if (_passwordController.text != pass) {
                          return "Passwords Don't Match";
                        }
                      },
                      onSaved: (pass) {
                        setState(() {
                          _password = pass!;
                        });
                      },
                    ),
                    const SizedBox(height: 25.0),

                    ///--------------------------------------------------------------------------------
                    ///--------------------------------- Sign Up Button  ------------------------------
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
                                  style: GoogleFonts.lato(
                                      color: Colors.white, letterSpacing: 1.5)),
                              onPressed: () {
                                _submitSignUpForm();
                              },
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),

                    ///--------------------------------------------------------------------------------
                    ///--------------------------------- Already have an account  ---------------------
                    ///--------------------------------------------------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                            style: TextStyle(
                              color: ConstantColors.navyBlue,
                              fontSize: 18,
                            )),
                        InkWell(
                          mouseCursor: SystemMouseCursors.click,
                          onTap: () {
                            //! Go To SignUp Page
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  color: ConstantColors.primaryRed,
                                  fontSize: 18,
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
