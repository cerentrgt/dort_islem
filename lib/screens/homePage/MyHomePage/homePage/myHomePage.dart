import 'package:dort_islem/screens/BolmePage/BolmePage.dart';
import 'package:dort_islem/screens/C%C4%B1karmaPage/CikarmaPage.dart';
import 'package:dort_islem/screens/CarpimTablosuPage/CarpimTablosu.dart';
import 'package:dort_islem/screens/CarpmaPage/CarpmaPage.dart';
import 'package:dort_islem/screens/ToplamaPage/toplamaPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Lottie.asset("assets/animasyon/kedi.json")),
            toplamaButton(),
            SizedBox(
              height: size.height * 0.05,
            ),
            cikarmaButton(),
            SizedBox(
              height: size.height * 0.05,
            ),
            carpmaButton(),
            SizedBox(
              height: size.height * 0.05,
            ),
            bolmeButton(),
            SizedBox(
              height: size.height * 0.05,
            ),
            carpimTableButton(),
          ],
        ),
      ),
    );
  }

  Widget toplamaButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 60),
        textStyle: const TextStyle(fontSize: 50),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      icon: const Icon(
        Icons.add,
        color: Color.fromARGB(255, 233, 241, 245),
      ),
      label: const Text(
        "TOPLAMA ",
        style: TextStyle(
            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ToplamaPage()));
      },
    );
  }

  Widget cikarmaButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 60),
        textStyle: const TextStyle(fontSize: 50),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      icon: const Icon(
        Icons.exposure,
        color: Colors.white,
      ),
      label: const Text(
        "ÇIKARMA ",
        style: TextStyle(
            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CikarmaPage()));
      },
    );
  }

  Widget carpmaButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 60),
        textStyle: const TextStyle(fontSize: 50),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      icon: const Icon(
        Icons.one_x_mobiledata,
        color: Colors.white,
      ),
      label: const Text(
        "ÇARPMA ",
        style: TextStyle(
            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CarpmaPage()));
      },
    );
  }

  Widget bolmeButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 60),
        textStyle: const TextStyle(fontSize: 50),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      icon: const Icon(
        Icons.tonality,
        color: Colors.white,
      ),
      label: const Text(
        "BÖLME ",
        style: TextStyle(
            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BolmePage()));
      },
    );
  }

  Widget carpimTableButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 60),
        textStyle: const TextStyle(fontSize: 50),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      icon: const Icon(
        Icons.app_registration_rounded,
        color: Colors.white,
      ),
      label: const Text(
        "ÇARPIM TABLOSU ",
        style: TextStyle(
            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CarpimTablosu()));
      },
    );
  }
}
