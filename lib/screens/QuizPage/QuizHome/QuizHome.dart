import 'package:dort_islem/screens/QuizPage/QuizPage.dart';
import 'package:dort_islem/screens/TrueFalsePage/TrueFalsePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Lottie.asset("assets/animasyon/airballon.json"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Quize Hoşgeldiniz",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            trueFalseSoru(),
            const SizedBox(
              height: 20,
            ),
            secmeliSoru(),
          ],
        ),
      ),
    );
  }

  Widget trueFalseSoru() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4DA9FF),
        fixedSize: const Size(250, 60),
        textStyle: const TextStyle(fontSize: 50),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      icon: const Icon(
        Icons.assistant_outlined,
        color: Color.fromARGB(255, 233, 241, 245),
      ),
      label: const Text(
        "Doğru/Yanlış Sorular",
        style: TextStyle(
            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TrueFalsePage()));
      },
    );
  }

  Widget secmeliSoru() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4DA9FF),
        fixedSize: const Size(250, 60),
        textStyle: const TextStyle(fontSize: 50),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      icon: const Icon(
        Icons.quiz_sharp,
        color: Color.fromARGB(255, 233, 241, 245),
      ),
      label: const Text(
        "Seçmeli Sorular",
        style: TextStyle(
            fontStyle: FontStyle.italic, fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const QuizPage()));
      },
    );
  }
}
