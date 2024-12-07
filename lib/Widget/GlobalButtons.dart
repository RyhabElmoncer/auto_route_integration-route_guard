import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../routes/app_router.gr.dart';

class GlobalButtons extends StatefulWidget {
  const GlobalButtons({Key? key}) : super(key: key);

  @override
  _GlobalButtonsState createState() => _GlobalButtonsState();
}

class _GlobalButtonsState extends State<GlobalButtons> {
  // Track the current selected index for BottomNavigationBar
  int _currentIndex = 0;

  // Handle tapping on the bottom navigation bar items
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate based on the selected index
    switch (index) {
      case 0:
        AutoRouter.of(context).push(const ProfileRoute());
        break;
      case 1:
        AutoRouter.of(context).push(const HomeRoute());
        break;
      case 2:
        AutoRouter.of(context).push(const AboutRoute());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.grey, // Adjust this color for the selected icon
      unselectedItemColor: Colors.grey, // Color for non-selected items
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About',
        ),
      ],
    );
  }
}
