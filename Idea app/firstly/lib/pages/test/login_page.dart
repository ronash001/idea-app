import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _acceptTerms = false;
  bool _isLoading = false; // Added loading indicator state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Your logo widget goes here
              Image.asset('assets/logo.png', height: 200, width: 200),
              const SizedBox(height: 16.0),

              // Sign In title with padding and alignment
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 16.0, bottom: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC700),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Email TextField with padding
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: 20.0,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // Add email validation logic here
                ),
              ),
              const SizedBox(height: 16.0),

              // Password TextField with padding
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Checkbox and "I accept the terms & conditions" text
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    'I accept the ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const Text(
                    'terms & conditions',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),

              
                  ElevatedButton(
  onPressed: _isLoading
      ? null
      : () async {
          setState(() {
            _isLoading = true;
          });

          // Simulating a delay before navigating to home page
          await Future.delayed(const Duration(seconds: 1));

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );

          setState(() {
            _isLoading = false;
          });
        },
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: const Color(0xFFFFC700),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    minimumSize: const Size(150.0, 50.0),
  ),
  child: _isLoading
      ? const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )
      : const Text(
          'Sign In',
          style: TextStyle(fontSize: 20.0),
        ),
),




              const SizedBox(height: 16.0),

              // Registration Text
              const Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Register ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Here',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
