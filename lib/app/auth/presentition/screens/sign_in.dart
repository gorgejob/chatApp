import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';
import 'package:chrush/app/auth/presentition/cubit/cubit.dart';
import 'package:chrush/app/core/widget/button.dart';
import 'package:chrush/app/core/widget/text_field.dart';
import 'package:chrush/app/core/widget/textstyle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  // تلميح: أبقيت فقط على الـ Controllers المستخدمة فعلياً في هذه الشاشة
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numbercontroller.text = "gorgejob231@gmail.com";
    passwordcontroller.text = "88884444g";
  }

  @override
  void dispose() {
    // تنظيف الذاكرة عند مغادرة الشاشة
    numbercontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 136, 84, 28),
                Color.fromARGB(255, 6, 97, 195),
                Color.fromARGB(255, 5, 169, 171),
              ],
            ),
          ),
          child: SafeArea(
            // 1. يقرأ أبعاد الشاشة المتاحة بدقة
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    // 2. يجبر المحتوى على أخذ كامل ارتفاع الشاشة كحد أدنى
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    // 3. يعطي الـ Column حجماً منطقياً لتشغيل الـ Spacer
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 100),
                            Text("Sign In", style: TextstyleText.textstyle_40),
                            const SizedBox(height: 180),

                            MyTextField(
                              text: "Number",
                              controller: numbercontroller,
                            ),
                            const SizedBox(height: 20),
                            MyTextField(
                              text: "Password",
                              controller: passwordcontroller,
                            ),
                            const SizedBox(height: 25),

                            GestureDetector(
                              onTap: () {
                                numbercontroller.text =
                                    "mohamadreda231@gmail.com";
                                passwordcontroller.text = "88884444s";

                                // context.read<AuthCubit>().navigatortopage(
                                // context,
                                // const SignUp(),
                                // );
                              },
                              child: Text(
                                "Dont have any account",
                                style: TextstyleText.textstyle_20,
                              ),
                            ),

                            // 4. الـ Spacer يعمل هنا الآن بدون شاشة حمراء
                            const Spacer(),

                            Mybutton(
                              ontap: () async {
                                await context.read<AuthCubit>().checkuser(
                                  UserSignIn(
                                    email: numbercontroller.text,
                                    password: passwordcontroller.text,
                                  ),
                                  context,
                                );
                              },
                              text: "Sign In",
                            ),
                            const SizedBox(
                              height: 25,
                            ), // مسافة أمان سفلية للكيبورد والـ Navigation Bar
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
