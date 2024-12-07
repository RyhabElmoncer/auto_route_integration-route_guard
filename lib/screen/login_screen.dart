import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  final Function(bool?) onResult;
  const LoginScreen({super.key, required this.onResult});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  _login() async {
    String username = _username.text.trim();
    String password = _password.text.trim();

    if (username == 'username' && password == 'password') {
      setState(() {
        _isLoading = true;
      });
      // Simulate a login delay
      await Future.delayed(const Duration(seconds: 2));
      // Successful login
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('logged_in', true);
      widget.onResult.call(true);
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Wrong username or password'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                'You must be logged in to access this page.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              // Username Input Field
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.blue[50], // Light blue for background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // Password Input Field
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.blue[50], // Light blue for background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // Login Button
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 27), // Larger padding for a bigger button
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18, // Increased font size
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // White text color
                  ),
                ),
                onPressed: _login,
              ),
              const SizedBox(height: 20.0),
              // Instructions for login
              const Text(
                'To login use username as "username" and password as "password".',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
