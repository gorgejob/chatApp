import 'package:chrush/app/core/widget/textstyle_text.dart';
import 'package:chrush/paths.dart';
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.ontap, required this.text});
  final void Function() ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(10, 5),
              blurRadius: 20,
              color: Color.fromARGB(255, 195, 195, 195),
            ),
            BoxShadow(
              offset: Offset(-10, -5),
              blurRadius: 20,
              color: Color.fromARGB(255, 195, 195, 195),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
