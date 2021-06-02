
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'navbar.dart';

// ignore: unused_element
Widget _defaultHome = new LoginScreen();

void main() async {
  _defaultHome = HomePage();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initilization,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );

          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;

                  if (user == null) {
                    return LoginScreen();
                  } else {
                    return HomePage();
                  }
                }

                return Scaffold(
                  body: Center(
                    child: Text("Cheking auth ...."),
                  ),
                );
              },
            );
          }

          return Scaffold(
            body: Center(
              child: Text("Connecting to the app..."),
            ),
          );
        });
  }
}
