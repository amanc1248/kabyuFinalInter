import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/AlreadyHaveAnAccount.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/Button.dart';
import 'package:provider/provider.dart';

import '../../contants.dart';

class EmailTab extends StatefulWidget {
  final TabController theTabController;
  EmailTab({@required this.theTabController});
  @override
  _EmailTabState createState() => _EmailTabState();
}

var googleSignInProvider;

class _EmailTabState extends State<EmailTab> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();

  final TextEditingController _contact = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);

    return Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Name TextformField 👇
            Padding(
              padding: kSignUpFormTextFieldPadding,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,

                maxLength: 30,
                keyboardType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
                ],
                decoration: InputDecoration(
                  border: kTextFieldBorder,
                  enabledBorder: kTextFieldEnabledBorder,
                  hintText: "Name",
                  labelText: "Name",
                ),
                controller: _name,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Empty";
                  }
                  return null;
                },
              ),
            ),

            //Contact TextformField 👇
            Padding(
              padding: kSignUpFormTextFieldPadding,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,

                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]')),
                ],
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: kTextFieldBorder,
                  enabledBorder: kTextFieldEnabledBorder,
                  hintText: "Contact",
                  labelText: "Contact",
                ),
                controller: _contact,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Empty";
                  }
                  return null;
                },
              ),
            ),

            //Address TextformField 👇
            Padding(
              padding: kSignUpFormTextFieldPadding,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,

                keyboardType: TextInputType.streetAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ,]')),
                ],
                decoration: InputDecoration(
                  border: kTextFieldBorder,
                  enabledBorder: kTextFieldEnabledBorder,
                  hintText: "Address",
                  labelText: "Address",
                ),
                controller: _address,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Empty";
                  }
                  return null;
                },
              ),
            ),
            GestureDetector(
                onTap: () {
                  if (_form.currentState.validate()) {
                    //saving the name, contact, and address to the provider
                    googleSignInProvider.userDetails[2] = _name.text;
                    googleSignInProvider.userDetails[3] = _contact.text;
                    googleSignInProvider.userDetails[4] = _address.text;

                    //showing the data into console
                    print("Name: " +
                        googleSignInProvider.userDetails[2] +
                        "\n" +
                        "Contact: " +
                        googleSignInProvider.userDetails[3] +
                        "\n" +
                        "Address" +
                        googleSignInProvider.userDetails[4]);
                    print(googleSignInProvider.userDetails);
                    //Going to the Profile Tab ⏭
                    widget.theTabController.animateTo(
                      (widget.theTabController.index + 1),
                    );
                  }
                },
                child: NextButton()),
            AlreadyHaveAnAccount()
          ],
        ));
  }
}
