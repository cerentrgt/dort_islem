import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../LoginPage/LoginScreen.dart';
import '../RegisterPage/RegisterScreen.dart';

class homePageBody extends StatefulWidget {
  const homePageBody({Key? key}) : super(key: key);

  @override
  State<homePageBody> createState() => _homePageBodyState();
}

class _homePageBodyState extends State<homePageBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
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
        ),
        Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: Lottie.asset("assets/animasyon/toplama.json"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Dört İşlem ",
                      style: TextStyle(
                        fontSize: 35,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: Lottie.asset("assets/animasyon/blme.json"),
                    ),
                  ],
                ),
                GoLogin(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: Lottie.asset("assets/animasyon/esittir.json"),
                    ),
                  ],
                ),
                GoRegister(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: Lottie.asset("assets/animasyon/cikarma.json"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: Lottie.asset("assets/animasyon/carpma.json"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget GoLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: const Color.fromARGB(15, 72, 13, 233),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: const Text(
            "GİRİŞ YAP",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget GoRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: const Color(0xFD2C8F1),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          child: const Text(
            "KAYIT OL",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
