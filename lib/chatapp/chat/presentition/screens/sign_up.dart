import "../../../../paths.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    // تنظيف الذاكرة للمتحكمات الأربعة عند الخروج من الشاشة
    namecontroller.dispose();
    emailcontroller.dispose();
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
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 100,
                            ), // قللت المسافة قليلاً لتناسب زيادة عدد الحقول
                            Text("Sign Up", style: TextstyleText.textstyle_40),
                            const SizedBox(height: 100),

                            MyTextField(
                              text: "Name",
                              controller: namecontroller,
                            ),
                            const SizedBox(height: 15),
                            MyTextField(
                              text: "Number",
                              controller: numbercontroller,
                            ),
                            const SizedBox(height: 15),
                            MyTextField(
                              text: "Email",
                              controller: emailcontroller,
                            ),
                            const SizedBox(height: 15),
                            MyTextField(
                              text: "Password",
                              controller: passwordcontroller,
                            ),
                            const SizedBox(height: 20),

                            GestureDetector(
                              onTap: () {
                                context.read<AuthCubit>().navigatortopage(
                                  context,
                                  const Signin(),
                                );
                              },
                              child: Text(
                                "Already have Account",
                                style: TextstyleText.textstyle_20,
                              ),
                            ),

                            // 4. الآن الـ Spacer سيعمل هنا بأمان تام وبدون أخطاء
                            const Spacer(),

                            Mybutton(
                              ontap: () async {
                                await context.read<AuthCubit>().adduser(
                                  UserEntitiey(
                                    name: namecontroller.text,
                                    email: emailcontroller.text,
                                    number: numbercontroller.text,
                                    password: passwordcontroller.text,
                                  ),
                                );
                              },
                              text: "Create Account",
                            ),
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
