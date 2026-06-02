import 'package:chrush/app/core/widget/textstyle_text.dart';
import 'package:chrush/paths.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.controller, required this.text});
  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(5, 10),
              blurRadius: 20,
              color: Colors.grey,
            ),
            BoxShadow(
              offset: Offset(-5, 0),
              blurRadius: 20,
              color: Colors.grey,
            ),
          ],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: TextField(
          scrollPadding: EdgeInsets.zero,
          controller: controller,
          cursorColor: Colors.black87,
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w900),
          decoration: InputDecoration(
            hintText: "Enter Your $text",
            hintStyle: TextStyle(color: Colors.black, fontSize: 5.sp),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
