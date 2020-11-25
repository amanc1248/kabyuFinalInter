import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/Provider/provider.dart';
import 'package:kabyu_feather_webs/Navigator/buttons.dart';
// import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
// import 'package:kabyu_feather_webs/views/3.%20ChatPage/Chat.dart';
// import 'package:kabyu_feather_webs/views/product_individual.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
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
        ChangeNotifierProvider<ProviderClass>(
            create: (context) => ProviderClass()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Buttons(),
      ),
    );
  }
}
