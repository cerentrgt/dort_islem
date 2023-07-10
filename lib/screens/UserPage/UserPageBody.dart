import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../service/AuthService.dart';
import '../homePage/MyHomePage/homePage/myHome.dart';
import '../homePage/homePage.dart';

class UserPageBody extends StatefulWidget {
  const UserPageBody({super.key});

  @override
  State<UserPageBody> createState() => _UserPageBodyState();
}

class _UserPageBodyState extends State<UserPageBody> {
  AuthService authService = AuthService();

  var userUid = FirebaseAuth.instance.currentUser!.uid;
  var userEmail = FirebaseAuth.instance.currentUser!.email ?? "";
  var userName = FirebaseAuth.instance.currentUser!.displayName ?? "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF5A74E6),
              Color(0xFF605DF5),
              Color(0xFF3D49B3),
              Color(0xFF0C1FCB),
            ]),
      ),
      child: Column(
        children: [
          const SizedBox(height: 60),
          userImageButton(),
          const SizedBox(height: 10),
          userNameButton(),
          userMailButton(),
          goHome(),
          goOut(),
        ],
      ),
    );
  }

  Widget userImageButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  children: [],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget userNameButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF4DA9FF),
              fixedSize: const Size(320, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    userName,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userMailButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF4DA9FF),
              fixedSize: const Size(320, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.mail_outline),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      userEmail,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget goHome() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF4DA9FF),
              fixedSize: const Size(320, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const myHome(),
                ),
              );
            },
            child: Row(
              children: const [
                Icon(Icons.home),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "AnaSayfa'ya Dön",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget goOut() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF4DA9FF),
              fixedSize: const Size(320, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              authService.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const homePage(),
                ),
              );
            },
            child: Row(
              children: const [
                Icon(Icons.logout),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Çıkış Yap..!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
