import 'package:cortal/Helpers/Constants.dart';
import 'package:cortal/Pages/Registration/Signup/SignUpPage.dart';
import 'package:cortal/UI_Elements/Circular_progrss.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    bool _obsecurePassword = true;
    String _password = "";
    String _idNumber = "";

    bool _isLoading = false;
    final _passwordController = TextEditingController();

    void _sumbitForm() async {}

    //To check fields when submit
    checkFields() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      }
      return false;
    }

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
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        mouseCursor: SystemMouseCursors.click,
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (context) => ResetPasswordPage()),
                          // );
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: ConstantColors.primaryRed,
                              fontSize: 14,
                              fontFamily: 'Trueno',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
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
                              child: Text(
                                "NEXT",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                _sumbitForm();
                              },
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",
                            style: TextStyle(
                              color: ConstantColors.navyBlue,
                              fontSize: 18,
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
