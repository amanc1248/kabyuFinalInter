import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/Provider/provider.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/Button.dart';
import 'package:provider/provider.dart';
import '../views/Authentication/contants.dart';
import '../views/Authentication/Sign Up/Signup Form/SignupSteps.dart';

class EmailPasswordConfirmPassword extends StatefulWidget {
  @override
  _EmailPasswordConfirmPasswordState createState() =>
      _EmailPasswordConfirmPasswordState();
}

var theProvider;

class _EmailPasswordConfirmPasswordState
    extends State<EmailPasswordConfirmPassword> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    theProvider = Provider.of<ProviderClass>(context, listen: false);

    return Form(
        key: _form,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          //Email TextFormField 👇
          Padding(
            padding: kSignUpFormTextFieldPadding,
            child: TextFormField(
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Empty';
                  }

                  return null;
                }),
          ),

          //Password TextFormField 👇
          Padding(
            padding: kSignUpFormTextFieldPadding,
            child: TextFormField(
                onChanged: (value) {
                  _form.currentState.validate();
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: kTextFieldBorder,
                  enabledBorder: kTextFieldEnabledBorder,
                  hintText: "Password",
                  labelText: "Password",
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.remove_red_eye,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                controller: _pass,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                }),
          ),

          //ConfirmPassword TextFormField 👇
          Padding(
            padding: kSignUpFormTextFieldPadding,
            child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _form.currentState.validate();
                },
                decoration: InputDecoration(
                  border: kTextFieldBorder,
                  enabledBorder: kTextFieldEnabledBorder,
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Color(0xff000000),
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
                  print(theProvider.userDetails);
                  //storing the email and the password

                  theProvider.userDetails[0] = _email.text;
                  theProvider.userDetails[1] = _pass.text;
                  print("Email: " +
                      theProvider.userDetails[0] +
                      "\n" +
                      "Password: " +
                      theProvider.userDetails[1]);
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
