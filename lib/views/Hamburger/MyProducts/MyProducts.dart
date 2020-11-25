import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Hamburger/MyProducts/MyProductswithbooks.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

class MyProducts extends StatefulWidget {
  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TopNavigationBar(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Icon(
                Icons.notifications,
                color: Color(0xff30009C),
                size: 30,
              ),
            )
          ],
          elevation: 0.0,
          titleSpacing: 0.0,
          centerTitle: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(35, 3, 106, 1),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(248, 248, 248, 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            "My Books",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Be a seller",
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(0, 0, 0, 0.38)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Easy step to become a business person",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 0.38)),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(26, 0, 26, 11),
                              child: Divider(
                                color: Color.fromRGBO(33, 33, 33, 0.08),
                                thickness: 1.0,
                                height: 10.0,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       // color: Color.fromRGBO(0,0,0,0.12),

                                  //       ),
                                  // ],
                                  border: Border.all(
                                      color: Color.fromRGBO(0, 0, 0, 0.12)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyProductsWithBooks()));
                                },
                                child: Text(
                                  "+ SELL/EXCHANGE BOOKS",
                                  style: TextStyle(
                                      color: Color.fromRGBO(98, 0, 238, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
