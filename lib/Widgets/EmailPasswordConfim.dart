import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/Button.dart';
import 'package:provider/provider.dart';
import '../views/Authentication/contants.dart';
import '../views/Authentication/Sign Up/Signup Form/SignupSteps.dart';
import 'package:email_validator/email_validator.dart';

class EmailPasswordConfirmPassword extends StatefulWidget {
  @override
  _EmailPasswordConfirmPasswordState createState() =>
      _EmailPasswordConfirmPasswordState();
}

// bool isPasswordCompliant(String password, [int minLength = 6]) {
//   if (password == null || password.isEmpty) {
//     return false;
//   }

//   bool hasMinLength = password.length > minLength;

// }

//For upper and lower case
bool isPasswordUpperLowerCase(String password) {
  bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
  return hasUppercase & hasLowercase;
}

//for password containing digits and special character
bool isPasswordDigitSpecialCharacter(String password) {
  bool hasDigits = password.contains(new RegExp(r'[0-9]'));
  bool hasSpecialCharacters =
      password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  return hasDigits & hasSpecialCharacters;
}

var googleSignInProvider;
bool passwordEye = true;
bool confirmPasswordEye = true;

class _EmailPasswordConfirmPasswordState
    extends State<EmailPasswordConfirmPassword> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);

    return Form(
        key: _form,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          //Email TextFormField 👇
          Padding(
            padding: kSignUpFormTextFieldPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: kTextFieldBorder,
                enabledBorder: kTextFieldEnabledBorder,
                hintText: "Email",
                labelText: "Email",
              ),
              controller: _email,
              validator: (value) => EmailValidator.validate(value)
                  ? null
                  : "Please enter a valid email",
            ),
          ),

          //Password TextFormField 👇
          Padding(
            padding: kSignUpFormTextFieldPadding,
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: passwordEye,
                decoration: InputDecoration(
                  border: kTextFieldBorder,
                  enabledBorder: kTextFieldEnabledBorder,
                  hintText: "Password",
                  labelText: "Password",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordEye = !passwordEye;
                      });
                    },
                    child: Icon(
                      passwordEye
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                controller: _pass,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Empty";
                  }
                  if (isPasswordUpperLowerCase(val) != true) {
                    return "Password must contain upper and lower case letter";
                  }
                  if (isPasswordDigitSpecialCharacter(val) != true) {
                    return "Password must contain digit with special character";
                  }
                  if (val.length < 6) {
                    return "Password length must be greater than 6";
                  }
                  return null;
                }),
          ),

          //ConfirmPassword TextFormField 👇
          Padding(
            padding: kSignUpFormTextFieldPadding,
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: confirmPasswordEye,
                decoration: InputDecoration(
                  border: kTextFieldBorder,
                  enabledBorder: kTextFieldEnabledBorder,
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        confirmPasswordEye = !confirmPasswordEye;
                      });
                    },
                    child: Icon(
                      confirmPasswordEye
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                controller: _confirmPass,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Empty";
                  }
                  if (val != _pass.text) {
                    return 'Not Match';
                  }
                  return null;
                }),
          ),
          GestureDetector(
              onTap: () {
                //Confirming the password
                if (_form.currentState.validate()) {
                  print(googleSignInProvider.userDetails);
                  //storing the email and the password

                  googleSignInProvider.userDetails[0] = _email.text;
                  googleSignInProvider.userDetails[1] = _pass.text;
                  print("Email: " +
                      googleSignInProvider.userDetails[0] +
                      "\n" +
                      "Password: " +
                      googleSignInProvider.userDetails[1]);
                  _email.clear();
                  _pass.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupEmail()));
                } else {
                  return null;
                }
              },
              child: NextButton()),
        ]));
  }
}
