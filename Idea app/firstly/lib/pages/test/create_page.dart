// create_page.dart

import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'charts_page.dart'; // Import your ChartsPage
import 'search_page.dart'; // Import your SearchPage
import 'profile_page.dart'; // Import your ProfilePage

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: Container(), // Empty container or any other content you may want
      bottomNavigationBar: BottomNavigation(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              // Home
              // Navigate to the home screen
              // You can replace the '/' with the actual route of your home screen
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
              // Create (Current Page)
              break;
            case 3:
              // Search
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
              break;
            case 4:
              // Profile
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}
