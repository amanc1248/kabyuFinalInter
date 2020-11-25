import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

class ErrorNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    TopNavigationBar(
                        // icon: Icons.chevron_left,
                        // ontap: () {
                        //   Get.back();
                        // },
                        ),
                    Container(
                      height: MediaQuery.of(context).size.width / 2,
                      child: Image.asset("assets/networkerror.png"),
                    ),
                    Text(
                      "LOL!",
                      style: TextStyle(color: Color(0XFFB00020), fontSize: 48),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The network connection is lost",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Presed similar books");
                },
                child: Text(
                  "See similar books",
                  style: TextStyle(color: Color(0XFF30009C), fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
