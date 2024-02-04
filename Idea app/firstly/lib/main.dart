import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Import your HomePage
import 'pages/charts_page.dart'; // Import your ChartsPage
import 'pages/search_page.dart'; // Import your SearchPage
import 'pages/create_page.dart'; // Import your CreatePage
import 'pages/profile_page.dart'; // Import your ProfilePage
import 'pages/login_page.dart'; // Import your LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Change the initial route to '/login'
      routes: {
        '/': (context) => const HomePage(),
        '/charts': (context) => const ChartsPage(),
        '/search': (context) => const SearchPage(),
        '/create': (context) => const CreatePage(),
        '/profile': (context) => const ProfilePage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
