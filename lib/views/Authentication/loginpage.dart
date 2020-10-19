import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 105.0, vertical: 100.0),
            padding: EdgeInsets.all(20),
            child: Text(
              "Kitab",
              style: TextStyle(
                  fontSize: 40.0,
                  color: Color(0xFF23036A),
                  fontWeight: FontWeight.w800,
                  fontFamily: "Abril Fatface"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: MyCustomForm(),
          )
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          _buildTextField(
            hintText: "Username",
          ),
          _buildTextField(
            icon: Icons.lock_outline,
            hintText: "Password",
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                  color: Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  elevation: 5,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF6E8DE4),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.0)),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/google.svg',
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No account? ",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color(0xFF6C63FF), fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
          // Add TextFormFields and RaisedButton here.
        ]));
  }

  Widget _buildTextField({String hintText, IconData icon}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Container(
          height: 60,
          alignment: Alignment.center,
          // padding: EdgeInsets.only(left: 15),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                hintText: hintText,
                prefixIcon: Icon(icon)),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
          ),
        ),
      ),
    );
  }
}
