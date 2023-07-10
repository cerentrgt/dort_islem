import 'package:dort_islem/screens/CarpimTablosuPage/NumberWidget/OneNumber.dart';
import 'package:dort_islem/screens/CarpimTablosuPage/NumberWidget/ThreeNumber.dart';
import 'package:flutter/material.dart';
import '../homePage/MyHomePage/homePage/myHome.dart';
import 'NumberWidget/EightNumber.dart';
import 'NumberWidget/FiveNumber.dart';
import 'NumberWidget/FourNumber.dart';
import 'NumberWidget/NineNumber.dart';
import 'NumberWidget/SevenNumber.dart';
import 'NumberWidget/SixNumber.dart';
import 'NumberWidget/TenNumber.dart';
import 'NumberWidget/TwoNumber.dart';
import 'NumberWidget/ZeroNumber.dart';

class CarpimTablosuBody extends StatelessWidget {
  const CarpimTablosuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ZeroNumber(),
                ),
              );
            },
            child: const Text(
              "0",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OneNumber()));
            },
            child: const Text(
              "1",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TwoNumber()));
            },
            child: const Text(
              "2",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ThreeNumber()));
            },
            child: const Text(
              "3",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FourNumber()));
            },
            child: const Text(
              "4",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FiveNumber()));
            },
            child: const Text(
              "5",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SixNumber()));
            },
            child: const Text(
              "6",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SevenNumber()));
            },
            child: const Text(
              "7",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EightNumber()));
            },
            child: const Text(
              "8",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NineNumber()));
            },
            child: const Text(
              "9",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TenNumber()));
            },
            child: const Text(
              "10",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const myHome(),
                ),
              );
            },
            child: const Text(
              "Geri Dön",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
