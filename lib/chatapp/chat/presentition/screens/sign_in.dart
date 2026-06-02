import "../../../../paths.dart";

class Signinchat extends StatefulWidget {
  const Signinchat({super.key});

  @override
  State<Signinchat> createState() => _SigninchatState();
}

class _SigninchatState extends State<Signinchat> {
  // تلميح: أبقيت فقط على الـ Controllers المستخدمة فعلياً في هذه الشاشة
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
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
          decoration: const BoxDecoration(color: Colors.white),
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
                            SizedBox(height: 50.h),
                            Text(
                              "Sign In",

                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.sp,
                              ),
                            ),
                            SizedBox(height: 80.h),

                            MyTextField(
                              text: "Email",
                              controller: numbercontroller,
                            ),
                            SizedBox(height: 10.h),
                            MyTextField(
                              text: "Password",
                              controller: passwordcontroller,
                            ),
                            SizedBox(height: 5.h),

                            GestureDetector(
                              onTap: () {
                                numbercontroller.text =
                                    "mohamadreda231@gmail.com";
                                passwordcontroller.text = "88884444s";
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Dont have any account ?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),

                            // 4. الـ Spacer يعمل هنا الآن بدون شاشة حمراء
                            const Spacer(),

                            Mybutton(
                              ontap: () async {
                                await context.read<Chatbloc>().signin(
                                  numbercontroller.text,
                                  passwordcontroller.text,
                                  context,
                                );
                              },
                              text: "Sign In",
                            ),
                            const SizedBox(height: 25),
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
