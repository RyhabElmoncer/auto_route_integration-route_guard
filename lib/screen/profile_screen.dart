import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/GlobalButtons.dart';
import '../routes/app_router.gr.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Function to handle logout
  Future<void> _logout(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    // After logging out, navigate to the login or home screen
    AutoRouter.of(context).push(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil', // Titre de l'AppBar
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
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: GlobalButtons(), // Your custom buttons/widget here
      ),
    );
  }
}
