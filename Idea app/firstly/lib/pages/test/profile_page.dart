// profile_page.dart

import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'charts_page.dart'; // Import your ChartsPage
import 'search_page.dart'; // Import your SearchPage
import 'create_page.dart'; // Import your CreatePage

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(), // Empty container or any other content you may want
      bottomNavigationBar: BottomNavigation(
        currentIndex: 4, // Set the appropriate index for 'Profile' in your navigation
        onTap: (index) {
          switch (index) {
            case 0:
              // Home
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              // Charts
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ChartsPage()),
              );
              break;
            case 2:
              // Create
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CreatePage()),
              );
              break;
            case 3:
              // Search
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
              break;
            case 4:
              // Profile (Current Page)
              break;
          }
        },
      ),
    );
  }
}
