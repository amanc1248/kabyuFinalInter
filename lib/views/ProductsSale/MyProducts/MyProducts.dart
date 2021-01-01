import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:kabyu_feather_webs/views/ProductsSale/MyProducts/MyProductswithbooks.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
                        MyBooksOverview(),
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

class MyBooksOverview extends StatefulWidget {
  @override
  _MyBooksOverviewState createState() => _MyBooksOverviewState();
}

class _MyBooksOverviewState extends State<MyBooksOverview> {
  @override
  Widget build(BuildContext context) {
    MyBooksProvider myBooksProvider = Provider.of<MyBooksProvider>(context);
    return Expanded(
      child: myBooksProvider.myBooksList.length == 0
          ? Center(child: withNoBooks())
          : ListView.builder(
              itemCount: myBooksProvider.myBooksList.length,
              itemBuilder: (context, index) => Container(
                height: 92,
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0)),
                    ],
                    color: Color.fromRGBO(244, 244, 244, 1)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image(
                          image: myBooksProvider.myBooksList[index].image != ''
                              ? NetworkImage(
                                  myBooksProvider.myBooksList[index].image)
                              : AssetImage("assets/howinnovationworks.jpg"),
                          fit: BoxFit.cover,
                          width: 65,
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Npr " +
                                  myBooksProvider.myBooksList[index].price +
                                  "/-",
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 107, 107, 1),
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              myBooksProvider.myBooksList[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SmoothStarRating(
                                  rating: myBooksProvider
                                      .myBooksList[index].rating
                                      .toDouble(),
                                  isReadOnly: true,
                                  size: 15,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  starCount: 5,
                                  allowHalfRating: true,
                                  spacing: 2.0,
                                  color: Colors.yellow,
                                  borderColor: Colors.yellow,
                                  onRated: (value) {
                                    print("rating value -> $value");
                                  },
                                ),
                                SizedBox(
                                  width: 9.5,
                                ),
                                Text(
                                  myBooksProvider.myBooksList[index].categoryid,
                                  style: TextStyle(
                                      color: Color.fromRGBO(48, 0, 156, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget withNoBooks() {
    return Center(
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
            style:
                TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.38)),
          ),
        ],
      ),
    );
  }
}
