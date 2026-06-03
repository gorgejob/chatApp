import 'package:chrush/app/auth/presentition/cubit/cubit.dart';
import 'package:chrush/app/home/presentition/cubit/cubit.dart';
import 'package:chrush/chatapp/chat/presentition/cubit/cubit.dart';
import 'package:chrush/chatapp/chat/presentition/screens/chatroom.dart';
import 'package:chrush/chatapp/chat/presentition/screens/sign_in.dart';
import 'package:chrush/core/shared/shared_prefernce.dart';
import 'package:chrush/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefernce().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => Chatbloc()),
      ],
      child: DevicePreview(enabled: false, builder: (context) => const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // المقاس المرجعي (تعديل الارتفاع)
      minTextAdapt: true, // تضمن إن الخطوط تتناسق مع أحجام الشاشات
      splitScreenMode: true, // تدعم وضع تقسيم الشاشة لو المستخدم مشغله
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Signinchat(),
        );
      },
    );
  }
}
