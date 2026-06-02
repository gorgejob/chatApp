import 'package:flutter/material.dart';

class BottomnavigatorbarHome extends StatelessWidget {
  const BottomnavigatorbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    int gorge = 0;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.blue,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: gorge,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),

        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (value) {
          gorge = value;
        },
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        selectedIconTheme: const IconThemeData(),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 209, 207, 207),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card_sharp),
            label: "cards",
            activeIcon: Icon(Icons.add_card_sharp, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
            activeIcon: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
