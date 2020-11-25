import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/AlreadyHaveAnAccount.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/Button.dart';

import '../../contants.dart';

class EmailTab extends StatefulWidget {
  @override
  _EmailTabState createState() => _EmailTabState();
}

class _EmailTabState extends State<EmailTab> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();

  final TextEditingController _contact = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
                  hintText: "Name",
                  labelText: "Name",
                ),
                controller: _name,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Empty';
                  }
                },
              ),
            ),
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
                  hintText: "Contact",
                  labelText: "Contact",
                ),
                controller: _contact,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Empty';
                  }
                },
              ),
            ),
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
                  hintText: "Address",
                  labelText: "Address",
                ),
                controller: _address,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Empty';
                  }
                },
              ),
            ),
            GestureDetector(
                onTap: () {
                  if (_form.currentState.validate()) {
                    
                  }
                },
                child: NextButton()),
            AlreadyHaveAnAccount()
          ],
        ));
  }
}
