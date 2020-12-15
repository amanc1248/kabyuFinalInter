import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/Hamburger%20Model/HamburgerOptionsClass.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Widgets/category.dart';
import 'package:kabyu_feather_webs/Widgets/products_grid.dart';
import 'package:kabyu_feather_webs/Widgets/wishlistgrid.dart';
import 'package:kabyu_feather_webs/services/database.dart';
import 'package:kabyu_feather_webs/views/2.%20ExplorePage/listproduct.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Signup%20Form/sign%20up%20form.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:kabyu_feather_webs/views/ProductsSale/MyProducts/MyProducts.dart';
import 'package:kabyu_feather_webs/views/Profile/SettingOpen/SettingOpen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

final List<HamburgerOptions> theHamburgerOptionsList = [
  HamburgerOptions(
      iconName: "Setting", iconSymbol: Icons.settings, theRoute: SettingOpen()),
  HamburgerOptions(
      iconName: "Profile", iconSymbol: Icons.person, theRoute: SettingOpen()),
  HamburgerOptions(
      iconName: "My Products",
      iconSymbol: Icons.card_travel,
      theRoute: MyProducts()),
  HamburgerOptions(
    iconName: "Logout",
    iconSymbol: Icons.arrow_forward,
    theRoute: SignUpForm(),
  )
];

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

  void initState() {
    Provider.of<ProductProvider>(context, listen: false).loadProducts();
    Provider.of<WishlistProvider>(context, listen: false).loadwishList();
    Provider.of<CategoryProvider>(context, listen: false).loadCategoryList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Future<void> _refreshList() async {
      getProduct();
      getWishlist();
    }

    return RefreshIndicator(
      onRefresh: _refreshList,
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
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              // Important: Remove any padding from the ListView.
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Color.fromRGBO(48, 0, 156, 1),
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ()),
                          // );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage("assets/profileimage.jpg"),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Masama Nikine",
                                        // bookStoresDetails[theIndex].bookStoreName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Text(
                                        // bookStoresDetails[theIndex].newMessage.toString() +
                                        "Click to view profile",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.6)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: theHamburgerOptionsList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    theHamburgerOptionsList[index].theRoute),
                          );
                        },
                        child: ListTile(
                          leading:
                              Icon(theHamburgerOptionsList[index].iconSymbol),
                          title: Text(theHamburgerOptionsList[index].iconName),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  BuildCategory(),
                  buildCards(title: "Popular Books"),
                  ProductGrid(
                    count: 2,
                  ),
                  buildCards(title: "My Wishlist"),
                  WishListGrid(
                    count:
                        wishlistProvider.wishlistproductList.length < 2 ? 1 : 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return buildExplore(productProvider, index);
                        },
                        itemCount: productProvider.productList.length,
                      )
                    ],
                  )),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget buildExplore(ProductProvider productProvider, int index) {
    return Container(
        height: 120,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width / 2 - 30,
                decoration: BoxDecoration(
                  image: productProvider.productList[index].image != ''
                      ? DecorationImage(
                          image: NetworkImage(
                              productProvider.productList[index].image),
                        )
                      : DecorationImage(
                          image: AssetImage("assets/howinnovationworks.jpg"),
                          fit: BoxFit.cover,
                        ),
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
                        Text(
                            (productProvider.productList[index].title != ''
                                ? productProvider.productList[index].title
                                : "\"" "Not Provided" "\""),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "Npr " +
                              (productProvider.productList[index].price != ''
                                  ? productProvider.productList[index].price +
                                      "/-"
                                  : "\"" "Not Provided" "\"" + "/-"),
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SmoothStarRating(
                          rating: productProvider.productList[index].rating,
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
                        ),
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right_alt,
                      color: Color(0XFF30009C),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListProducts()));
                      },
                      child: Text(
                        "view more",
                        style: TextStyle(color: Color(0XFF30009C)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
