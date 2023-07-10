import 'package:dort_islem/models/dbConnect.dart';
import 'package:dort_islem/models/toplamaModel.dart';
import 'package:dort_islem/screens/QuizPage/OptionCard.dart';
import 'package:dort_islem/screens/ToplamaPage/toplamaPageBody.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../QuizPage/NextButton.dart';
import '../QuizPage/ResultBox.dart';

class ToplamaPage extends StatefulWidget {
  const ToplamaPage({super.key});

  @override
  State<ToplamaPage> createState() => _ToplamaPageState();
}

class _ToplamaPageState extends State<ToplamaPage> {
  var db = DBConnect();

  late Future _questions;

  Future<List<ToplamaModel>> getData() async {
    return db.fetchTopQuestion();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => ResultBox(
                result: score,
                onPressed: startOver,
                questionLength: questionLength,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20),
            content: Text("Lütfen bekleyin soru yükleniyor")));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<ToplamaModel>>,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractData = snapshot.data as List<ToplamaModel>;
            return Scaffold(
              backgroundColor: backgroundColor,
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ToplamaPageBody(
                        question: extractData[index].title,
                        indexAction: index,
                        totalQuestion: extractData.length),
                    const Divider(
                      color: natural,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    for (int i = 0; i < extractData[index].options.length; i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(
                            extractData[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractData[index].options.keys.toList()[i],
                          color: isPressed
                              ? extractData[index].options.values.toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : natural,
                        ),
                      )
                  ],
                ),
              ),
              appBar: AppBar(
                title: const Text("SORULAR"),
                backgroundColor: backgroundColor,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Skor $score",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return Container(
            color: const Color(0xFF4DA9FF),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lütfen bekleyin sorular yükleniyor",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(
          child: Text("Soru yok"),
        );
      },
    );
  }
}
