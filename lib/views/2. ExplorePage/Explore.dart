import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabyu_feather_webs/Widgets/Rating_Bar.dart';
import 'package:kabyu_feather_webs/Widgets/products_grid.dart';
import 'package:kabyu_feather_webs/Widgets/wishlistgrid.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:kabyu_feather_webs/views/Product%20Individual/product_individual.dart';

class ExplorePage extends StatefulWidget {
  static const String id = 'explorePage';

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool _isVisibleCategory = false;
  void showExtraCategory() {
    setState(() {
      _isVisibleCategory = !_isVisibleCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TopNavigationBar(
          // icon: Icons.menu,
          // ontap: () {},
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              buildCategory(),
              buildCards(title: "Popular Books"),
              ProductGrid(),
              buildCards(title: "My Wishlist"),
              WishListGrid(),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  buildExplore(),
                  buildExplore(),
                  buildExplore(),
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCategory() {
    return Container(
      child: Column(
        children: [
          buildRowCategory(
              name1: "Science",
              name2: "Psychlog",
              name3: "Thriller",
              color1: Color(0xFFF2E7FE),
              color2: Color(0xFFF2E7FE),
              textcolor: Colors.black,
              onpressed: () {
                Get.to(ProductIndividual());
              }),
          buildRowCategory(
              name1: "Drama",
              name2: "Romance",
              name3: _isVisibleCategory ? "Less " : "More ",
              color1: Color(0xFFF2E7FE),
              color2: Color(0xFF3700B3),
              textcolor: Colors.white,
              icon: _isVisibleCategory ? Icons.remove : Icons.add,
              onpressed: showExtraCategory),
          Visibility(
            visible: _isVisibleCategory,
            child: Column(children: [
              buildRowCategory(
                  name1: "Science",
                  name2: "Psychlog",
                  name3: "Thriller",
                  color1: Color(0xFFF2E7FE),
                  color2: Color(0xFFF2E7FE),
                  textcolor: Colors.black,
                  onpressed: () {}),
              buildRowCategory(
                  name1: "Drama",
                  name2: "Romance",
                  name3: "Science",
                  color1: Color(0xFFF2E7FE),
                  color2: Color(0xFFF2E7FE),
                  textcolor: Colors.black,
                  onpressed: () {}),
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildRowCategory(
      {String name1,
      String name2,
      String name3,
      Color color1,
      Color color2,
      Color textcolor,
      IconData icon,
      Function onpressed}) {
    return Row(
      children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: ButtonTheme(
                minWidth: 100,
                height: 30,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(name1),
                  color: color1,
                ),
              ),
            ),
            Container(
              child: ButtonTheme(
                minWidth: 100,
                height: 30,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(name2),
                  color: color1,
                ),
              ),
            ),
            Container(
              child: ButtonTheme(
                minWidth: 100,
                height: 30,
                child: RaisedButton(
                  onPressed: onpressed,
                  child: Row(
                    children: [
                      Text(
                        name3,
                        style: TextStyle(color: textcolor),
                      ),
                      Icon(
                        icon,
                        size: 15,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  color: color2,
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }

  Widget buildExplore() {
    return Container(
        height: 120,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Image.network(
                  'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1086&q=80',
                  fit: BoxFit.fill,
                ),
              ),
              SingleChildScrollView(
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    margin: EdgeInsets.only(
                        left: 20.0, top: 9, right: 9, bottom: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("How innovation works",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "Npr 120",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        RatingBar(),
                        Text("Science-Fiction",
                            style: TextStyle(color: Color(0XFF30009C))),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }

  Widget buildCards({String title}) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right_alt,
                      color: Color(0XFF30009C),
                    ),
                    Text(
                      "view more",
                      style: TextStyle(color: Color(0XFF30009C)),
                    )
                  ],
                ),
              )
            ],
          ),

          // Container(
          //   height: 240,
          //   width: double.infinity,
          //   child: GridView.count(
          //     childAspectRatio: MediaQuery.of(context).size.width / 2 / 240,

          //     crossAxisCount: 2,
          //     children: List.generate(2, (index) {
          //       return ;
          //     }),
          //   ),
          // )
        ],
      ),
    );
  }
}
