import 'package:dort_islem/firebaseconfigurations.dart';
import 'package:dort_islem/screens/homePage/MyHomePage/homePage/myHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/homePage/homePage.dart';

final FirebaseConfigurations _configurations = FirebaseConfigurations();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: _configurations.apiKey,
          appId: _configurations.appId,
          messagingSenderId: _configurations.messagingSenderId,
          projectId: _configurations.projectId));

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const myHome();
          } else {
            return const homePage();
          }
        },
      ),
    );
  }
}
