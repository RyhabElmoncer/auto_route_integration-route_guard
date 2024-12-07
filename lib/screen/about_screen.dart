import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/GlobalButtons.dart';
import '../routes/app_router.gr.dart';

@RoutePage()
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // Function to handle logout
  Future<void> _logout(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    // After logging out, navigate to the home screen
    AutoRouter.of(context).push(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu À propos', // Titre de l'AppBar
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context), // Logout when clicked
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text('Information About the App...'), // Content for the About screen
              ),
            ),
          ),
          const GlobalButtons(), // Global buttons at the bottom
        ],
      ),
    );
  }
}
