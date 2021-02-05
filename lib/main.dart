import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabyu_feather_webs/Provider/BottomNavigationProvider/BottomNavigationProvider.dart';
import 'package:kabyu_feather_webs/Provider/ChangePassword/ChangePasswordProvider.dart';
import 'package:kabyu_feather_webs/Provider/ChatProvider/ChatProvider.dart';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Provider/UserProvider.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
import 'package:kabyu_feather_webs/views/Authentication/Login/Login%20form.dart';
import 'package:kabyu_feather_webs/views/Authentication/ResetPassword/ResetPassword.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Signup%20Form/sign%20up%20form.dart';
import 'package:kabyu_feather_webs/views/Navigation/buttomNavigationBar.dart';
import 'package:kabyu_feather_webs/views/ProductsSale/MyProducts/product_ind_add.dart';
import 'package:provider/provider.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      print("An eror occured before initialization");
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      print("Initializing the flutter fire");
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleSignInProvider>(
            create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider<WishlistProvider>(
            create: (context) => WishlistProvider()),
        ChangeNotifierProvider<GoogleSignInProvider>(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider<ChangePasswordProvider>(
          create: (context) => ChangePasswordProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationProvider>(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider<WishlistProvider>(
            create: (context) => WishlistProvider()),
        ChangeNotifierProvider<ChatProvider>(
            create: (context) => ChatProvider(context: context)),
        ChangeNotifierProvider<MyBooksProvider>(
            create: (context) => MyBooksProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<AddProductsProvider>(
            create: (context) => AddProductsProvider()),
      ],
      child: GetMaterialApp(
        routes: {
          WishListPage.id: (context) => WishListPage(),
          "/signUpForm": (context) => SignUpForm(),
          "/loginForm": (context) => Login(),
          "/resetPasswordForm": (context) => ResetPassword(),
          "/homePage": (context) => MyHomePage(),
          "/productInAdd": (context) => ProductInAdd(),
        },
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, value, child) => StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return MyHomePage();
            }
            return Login();
          }),
    );
  }
}
