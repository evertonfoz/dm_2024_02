import 'package:flutter/material.dart';

class NavigationRailNavigation extends StatefulWidget {
  const NavigationRailNavigation({super.key});

  @override
  State<NavigationRailNavigation> createState() =>
      _NavigationRailNavigationState();
}

class _NavigationRailNavigationState extends State<NavigationRailNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.search),
              label: Text('Search'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person),
              label: Text('Profile'),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text('Selected Index: $_selectedIndex'),
          ),
        ),
      ],
    );
  }
}
