import 'package:flutter/material.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blue,
        title: const Text(
          "مكتبة البطل",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      );
  }
}