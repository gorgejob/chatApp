import 'package:chrush/app/home/presentition/cubit/cubit.dart';
import 'package:chrush/app/home/presentition/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageviewProduct extends StatelessWidget {
  const PageviewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:
                () =>
                    context.read<HomeCubit>().navigatortopage(context, Home()),
            icon: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
          ),
        ],
        title: Text(
          "detail product",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue,
        toolbarHeight: 100,
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 150),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "image product",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "اسم المنتح : كتاب محمد صلاح 3ث",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "تفاصيل المنتح : كتاب يحتوي علي الكثير من الكتب",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "\$ سعر المنتح : 50 ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
