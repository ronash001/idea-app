// bottom_navigation.dart

import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, size: 30.0),
            label: 'Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 30.0),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30.0),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30.0),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: const Color.fromARGB(255, 27, 26, 26),
        selectedItemColor: const Color.fromARGB(255, 182, 157, 14),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTap,
      ),
    );
  }
}
