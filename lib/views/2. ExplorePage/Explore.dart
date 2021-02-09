import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:kabyu_feather_webs/Model/Hamburger%20Model/HamburgerOptionsClass.dart';
import 'package:kabyu_feather_webs/Model/UserDetail.dart';
import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/Model/product_individual_carousel.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Provider/UserProvider.dart';
import 'package:kabyu_feather_webs/Widgets/category.dart';
import 'package:kabyu_feather_webs/Widgets/products_grid.dart';
import 'package:kabyu_feather_webs/Widgets/wishlistgrid.dart';
import 'package:kabyu_feather_webs/services/database.dart';
import 'package:kabyu_feather_webs/views/2.%20ExplorePage/listproduct.dart';
import 'package:kabyu_feather_webs/views/Authentication/Login/Login%20form.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Authentication/auth.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:kabyu_feather_webs/views/Product%20Individual/product_individual.dart';
import 'package:kabyu_feather_webs/views/ProductsSale/MyProducts/MyProducts.dart';
import 'package:kabyu_feather_webs/views/Profile/SettingOpen/SettingOpen.dart';
import 'package:kabyu_feather_webs/views/Profile/profile_edit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

final List<HamburgerOptions> theHamburgerOptionsList = [
  HamburgerOptions(
      iconName: "Setting", iconSymbol: Icons.settings, theRoute: SettingOpen()),
  HamburgerOptions(
      iconName: "Profile", iconSymbol: Icons.person, theRoute: ProfileEdit()),
  HamburgerOptions(
      iconName: "My Products",
      iconSymbol: Icons.card_travel,
      theRoute: MyProducts()),
  HamburgerOptions(
    iconName: "Logout",
    iconSymbol: Icons.arrow_forward,
    theRoute: Login(),
  )
];

class ExplorePage extends StatefulWidget {
  static const String id = 'explorePage';

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

UserProvider userProvider;

class _ExplorePageState extends State<ExplorePage> {
  bool _isVisibleCategory = false;
  void showExtraCategory() {
    setState(() {
      _isVisibleCategory = !_isVisibleCategory;
    });
  }

  void initState() {
    Provider.of<UserProvider>(context, listen: false).loadUserDetail();
    Provider.of<ProductProvider>(context, listen: false).loadProducts();
    Provider.of<WishlistProvider>(context, listen: false).loadwishList();
    Provider.of<CategoryProvider>(context, listen: false).loadCategoryList();
    Provider.of<MyBooksProvider>(context, listen: false).loadMyBooksList();
    super.initState();
  }

  theUserImageMain() {
    if (userProvider.userDetail == null) {
      return CircularProgressIndicator();
    } else if (userProvider.userDetail[0].image == null) {
      return CircleAvatar(
          radius: 20,
          child: Text('${userProvider.userDetail[0].name[0]}'.toUpperCase()));
    } else {
      return CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(userProvider.userDetail[0].image),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    MyBooksProvider myBooksProvider = Provider.of<MyBooksProvider>(context);
    userProvider = Provider.of<UserProvider>(context);

    Future<void> _refreshList() async {
      getProduct();
      getWishlist();
    }

    return ProgressHUD(
      indicatorColor: Color(0xff6200EE),
      child: RefreshIndicator(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileEdit()),
                            );
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    theUserImageMain(),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            userProvider.userDetail == null
                                                ? "User"
                                                : userProvider
                                                    .userDetail[0].name,
                                            overflow: TextOverflow.ellipsis,
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
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.6)),
                                          ),
                                        ],
                                      ),
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
                          onTap: () async {
                            if (theHamburgerOptionsList[index].iconName ==
                                "Logout") {
                              AuthHelper.logOut();
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              await preferences.clear();
                              print("Clearing Shared Preference");
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/loginForm", (r) => false);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          theHamburgerOptionsList[index]
                                              .theRoute));
                            }
                          },
                          child: ListTile(
                            leading:
                                Icon(theHamburgerOptionsList[index].iconSymbol),
                            title:
                                Text(theHamburgerOptionsList[index].iconName),
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
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                BuildCategory(),
                buildCards(
                    title: "Popular Books",
                    myList: productProvider.productList,
                    viewMoreTitle: "Popular Books"),
                ProductGrid(
                  count: 2,
                ),
                myBooksProvider.myBooksList.length != 0
                    ? buildCards(
                        title: "My Books",
                        myList: myBooksProvider.myBooksList,
                        viewMoreTitle: "My Books")
                    : SizedBox(),
                myBooksProvider.myBooksList.length != 0
                    ? MyBooksGrid(
                        count: myBooksProvider.myBooksList.length < 2 ? 1 : 2)
                    : SizedBox(),
                wishlistProvider.wishlistproductList.length != 0
                    ? buildCards(
                        title: "My Wishlist",
                        myList: wishlistProvider.wishlistproductList,
                        viewMoreTitle: "Wishlist Books")
                    : SizedBox(),
                wishlistProvider.wishlistproductList.length != 0
                    ? WishListGrid(
                        count: wishlistProvider.wishlistproductList.length < 2
                            ? 1
                            : 2,
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
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
          )),
        ),
      ),
    );
  }

  Widget buildExplore(ProductProvider productProvider, int index) {
    checkExploreImage(index) {
      if (productProvider.productList[index].image == null) {
        return Container(
            decoration: BoxDecoration(color: Colors.grey),
            height: 135,
            width: MediaQuery.of(context).size.width / 2 - 30,
            child: Center(
              child: Text(
                '${productProvider.productList[index].title[0]}'.toUpperCase(),
                style: TextStyle(fontSize: 25),
              ),
            ));
      } else {
        return Container(
          height: 120,
          width: MediaQuery.of(context).size.width / 2 - 30,
          decoration: BoxDecoration(
            image: productProvider.productList[index].image != ''
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        NetworkImage(productProvider.productList[index].image),
                  )
                : DecorationImage(
                    image: AssetImage("assets/howinnovationworks.jpg"),
                    fit: BoxFit.cover,
                  ),
          ),
        );
      }
    }

    return Container(
        // height: 120,
        child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        children: [
          checkExploreImage(index),
          Column(children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              margin: EdgeInsets.only(left: 20.0, top: 9, right: 9, bottom: 9),
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
                    ),
                  ),
                  Text(
                    "Npr " +
                        (productProvider.productList[index].price != ''
                            ? productProvider.productList[index].price + "/-"
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
        ],
      ),
    ));
  }

//THis is for view more button
  Widget buildCards(
      {String title, List<Product> myList, String viewMoreTitle}) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 16),
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
                                builder: (context) => ListProducts(
                                      myList: myList,
                                      title: viewMoreTitle,
                                    )));
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

class MyBooksGrid extends StatefulWidget {
  final int count;

  const MyBooksGrid({Key key, this.count}) : super(key: key);
  @override
  _MyBooksGridState createState() => _MyBooksGridState();
}

MyBooksProvider myBooksProvider;

class _MyBooksGridState extends State<MyBooksGrid> {
  @override
  Widget build(BuildContext context) {
    myBooksProvider = Provider.of<MyBooksProvider>(context);
    print("My BookList: 👇");
    print(myBooksProvider.myBooksList);
    return myBooksProvider.myBooksList.length == 0
        ? Center(child: Text("YOu do not have any products"))
        : Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Container(
                height: 225,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  children: List.generate(widget.count, (index) {
                    return MyBooksList(
                      book: index,
                    );
                  }),
                )),
          );
  }
}

class MyBooksList extends StatefulWidget {
  final int book;
  const MyBooksList({Key key, this.book}) : super(key: key);

  @override
  _MyBooksListState createState() => _MyBooksListState();
}

class _MyBooksListState extends State<MyBooksList> {
  checkBookImage() {
    print("👇👇👇");
    print(myBooksProvider.myBooksList);
    if (myBooksProvider.myBooksList[widget.book].image == null) {
      return Container(
          decoration: BoxDecoration(color: Colors.grey),
          height: 135,
          child: Center(
            child: Text(
              '${myBooksProvider.myBooksList[widget.book].title[0]}'
                  .toUpperCase(),
              style: TextStyle(fontSize: 25),
            ),
          ));
    } else {
      return Container(
        height: 135,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(myBooksProvider.myBooksList[widget.book].image),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    MyBooksProvider myBooksProvider = Provider.of<MyBooksProvider>(context);

    // print(wishlistProvider.currentWishlist.book_Id);
    return GestureDetector(
      onTap: () {
        myBooksProvider.myCurrentBook =
            myBooksProvider.myBooksList[widget.book];

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductIndividual(
                      myIndividualProduct: myBooksProvider.myCurrentBook,
                    )));
      },
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                checkBookImage(),
                Container(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10, right: 5, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        child:
                            Text(myBooksProvider.myBooksList[widget.book].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                      ),
                      Container(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Npr " +
                                  myBooksProvider
                                      .myBooksList[widget.book].price,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.more_vert, color: Colors.black54),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
