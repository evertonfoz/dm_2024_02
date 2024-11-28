import 'package:flutter/material.dart';

class BottomNavigationNavigation extends StatefulWidget {
  const BottomNavigationNavigation({super.key});

  @override
  State<BottomNavigationNavigation> createState() =>
      _BottomNavigationNavigationState();
}

class _BottomNavigationNavigationState
    extends State<BottomNavigationNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: 0,
      onTap: (index) {},
    );
  }
}
