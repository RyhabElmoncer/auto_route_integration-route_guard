import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_router.gr.dart';
import '../screen/home_screen.dart';

class GlobalButtons extends StatefulWidget {
  const GlobalButtons({super.key});

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

  // Function to handle logout


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Current Index: $_currentIndex', style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
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
      ),
    );
  }
}
