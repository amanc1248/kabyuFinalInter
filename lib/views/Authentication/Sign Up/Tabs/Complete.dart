import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kabyu_feather_webs/Model/Provider/provider.dart';
import 'package:provider/provider.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

class CompleteEmail extends StatefulWidget {
  @override
  _CompleteEmailState createState() => _CompleteEmailState();
}

var theProvider;

class _CompleteEmailState extends State<CompleteEmail> {
  @override
  Widget build(BuildContext context) {
    theProvider = Provider.of<ProviderClass>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(bottom: 91),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: SvgPicture.asset(
                  "assets/complete.svg",
                ),
              ),
            ),
            Text(
              "WELCOME",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Abril Fatface",
                  color: Color.fromRGBO(0, 0, 0, 1)),
            ),
            Text(
              "We are setting up for you",
              style:
                  TextStyle(fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.6)),
            ),
            theProvider.showSpinner ? CircularProgressIndicator() : SizedBox()
          ],
        ),
      ),
    );
  }
}
// //Creating user in firebase👇
//                       try {
//                         UserCredential userCredential =
//                             await auth.createUserWithEmailAndPassword(
//                                 email: theProvider.userDetails[0],
//                                 password: theProvider.userDetails[1]);
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'weak-password') {
//                           print('The password provided is too weak.');
//                         } else if (e.code == 'email-already-in-use') {
//                           print('The account already exists for that email.');
//                         }
//                       } catch (e) {
//                         print(e);
//                       }

//                       //Saving to firebase database 👇
//                       firestoreSave.collection('users').add({
//                         'email': theProvider.userDetails[0],
//                         'password': theProvider.userDetails[1],
//                         'name': theProvider.userDetails[2],
//                         'phone_number': theProvider.userDetails[3],
//                         'address': theProvider.userDetails[4],
//                       }).then((value) {
//                         print(value.id);
//                       });

//                       //going to login page👇
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Login()));
