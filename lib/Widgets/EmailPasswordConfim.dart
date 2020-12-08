import 'package:flutter/material.dart';
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

// String validateEmail(String value) {
//   Pattern pattern =
//       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//       r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//       r"{0,253}[a-zA-Z0-9])?)*$";
//   RegExp regex = new RegExp(pattern);
//   if (!regex.hasMatch(value) || value == null)
//     return 'Enter a valid email address';
//   else
//     return null;
// }

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
              onChanged: (value) {
                _form.currentState.validate();
              },
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
                keyboardType: TextInputType.emailAddress,
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
                      Icons.remove_red_eye,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                controller: _pass,
                validator: (val) {
                  // if (val.isEmpty) {
                  //   return 'Empty';
                  // }
                  return null;
                }),
          ),

          //ConfirmPassword TextFormField 👇
          Padding(
            padding: kSignUpFormTextFieldPadding,
            child: TextFormField(
                obscureText: confirmPasswordEye,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      Icons.remove_red_eye,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                controller: _confirmPass,
                validator: (val) {
                  // if (val.isEmpty) {
                  //   return "Empty";
                  // }
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
// class EmailPasswordConfirmPassword extends StatefulWidget {
//   final bool obscureTextValue;
//   final Function onChangedFunction;
//   final String hintString;
//   final String labelString;
//   final IconData suffixIcon;
//   EmailPasswordConfirmPassword(
//       {@required this.obscureTextValue,
//       this.onChangedFunction,
//       @required this.hintString,
//       @required this.labelString,
//       this.suffixIcon});
//   @override
//   _EmailPasswordConfirmPasswordState createState() =>
//       _EmailPasswordConfirmPasswordState();
// }

// class _EmailPasswordConfirmPasswordState
//     extends State<EmailPasswordConfirmPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//            padding: kSignUpFormTextFieldPadding,
//       child: TextField(
//         obscureText: widget.obscureTextValue,
//         onChanged: widget.onChangedFunction,
//         keyboardType: TextInputType.emailAddress,
//         decoration: InputDecoration(
//           border: kTextFieldBorder,
//           // errorText: validate ? 'Password Can\'t Be Empty' : null,
//           enabledBorder: kTextFieldEnabledBorder,
//           hintText: widget.hintString,
//           labelText: widget.labelString,
//           suffixIcon: Icon(
//             widget.suffixIcon,
//             color: Color(0xff000000),
//           ),
//         ),
//       ),
//     );
//   }
// }
