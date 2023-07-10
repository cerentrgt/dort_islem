import 'package:flutter/material.dart';
import 'CarpimTablosuBody.dart';

class CarpimTablosu extends StatefulWidget {
  const CarpimTablosu({super.key});

  @override
  State<CarpimTablosu> createState() => _CarpimTablosuState();
}

class _CarpimTablosuState extends State<CarpimTablosu> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: CarpimTablosuBody(),
    );
  }
}
