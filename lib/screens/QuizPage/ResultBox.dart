import 'package:dort_islem/screens/homePage/MyHomePage/homePage/myHome.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key,
      required this.result,
      required this.questionLength,
      required this.onPressed});

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      content: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: result == questionLength / 2
                  ? const AssetImage("assets/images/calis.png")
                  : result < questionLength / 2
                      ? const AssetImage("assets/images/yeterli.png")
                      : const AssetImage("assets/images/basarili.png"),
              radius: 80,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? incorrect
                      : correct,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sonuç",
              style: TextStyle(color: natural, fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: result == questionLength / 2
                    ? Colors.yellow
                    : result < questionLength / 2
                        ? incorrect
                        : correct,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              child: Text(
                "$result/$questionLength",
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              result == questionLength / 2
                  ? "neredeyse"
                  : result < questionLength / 2
                      ? "Tekrar deneyin"
                      : "Başarili",
              style: const TextStyle(color: natural),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.refresh_sharp,
                    color: Colors.blue,
                  ),
                  Text(
                    'Baştan Başla ',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 20, letterSpacing: 1),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const myHome()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  Text(
                    'Ana Menü',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 20, letterSpacing: 1),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
