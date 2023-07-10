import 'package:dort_islem/screens/homePage/homePageBody.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: homePageBody(),
    );
  }
}
