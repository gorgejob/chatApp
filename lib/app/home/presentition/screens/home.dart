import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:chrush/app/home/presentition/cubit/cubit.dart';
import 'package:chrush/app/home/presentition/cubit/cubit_state.dart';
import 'package:chrush/app/home/presentition/widgets/home/appbar_home.dart';
import 'package:chrush/app/home/presentition/widgets/home/bottomnavigatorbar_home.dart';
import 'package:chrush/app/home/presentition/widgets/home/lisstview_container_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int gorge = 0;
  List<BooksModel> gorge1 = [];

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
      // bottonnavigatorbar to navigator to home , cards and profile
      bottomNavigationBar: const BottomnavigatorbarHome(),
      // appbar in home page
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100), // نفس الارتفاع اللي أنت اخترته
        child: AppbarHome(),
      ),
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeCubitState>(
          listener: (context, state) {
            if (state is Succes) {
              gorge1 = state.data;
            }
          },
          builder: (context, state) {
            return ListView.builder(
              itemCount: gorge1.length,
              itemBuilder: (context, index) {
                final item = gorge1[index];
                return LisstviewContainerHome(item: item);
              },
            );
          },
        ),
      ),
    );
  }
}
