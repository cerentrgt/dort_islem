import 'package:dort_islem/screens/QuizPage/QuizHome/QuizHome.dart';
import 'package:dort_islem/screens/UserPage/UserPage.dart';
import 'package:dort_islem/screens/homePage/MyHomePage/homePage/myHomePage.dart';
import 'package:flutter/material.dart';

class myHome extends StatefulWidget {
  const myHome({super.key});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  int _currentIndex = 0;
  List<Widget> body = [
    const myHomePage(),
    const UserPage(),
    const QuizHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlue[200],
        unselectedItemColor: Colors.cyan[900],
        backgroundColor: Colors.white60,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: "Sorular",
              icon: Icon(Icons.question_mark),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.theater_comedy_outlined),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              label: "Quiz",
              icon: Icon(Icons.quiz),
              backgroundColor: Colors.yellow),
        ],
      ),
    );
  }
}
