import 'package:flutter/material.dart';

import '../../colors.dart';

class CarpmaPageBody extends StatelessWidget {
  const CarpmaPageBody(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestion});

  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0CCBBB),
              Color(0xFF0CCCCC),
              Color(0xFF0BBBBB),
              Color(0xFF0AAAAA),
            ]),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Soru = ${indexAction + 1} / $totalQuestion",
                style: const TextStyle(
                  fontSize: 24,
                  color: natural,
                ),
              ),
            ],
          ),
          Text(
            "$question = ?",
            style: const TextStyle(
              fontSize: 24,
              color: natural,
            ),
          ),
        ],
      ),
    );
  }
}
