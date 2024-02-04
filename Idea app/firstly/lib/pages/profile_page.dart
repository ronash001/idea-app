import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'charts_page.dart';
import 'search_page.dart';
import 'create_page.dart';
import 'menu_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 70.0),
              child: Icon(Icons.person, size: 30.0),
            ),
            SizedBox(width: 8.0),
            Text('Profile'),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, size: 33.0),
            onPressed: () {
              // Navigate to MenuPage when the menu icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 880.0, // Adjust the height as needed
              color: const Color.fromARGB(255, 252, 253, 255), // Change the background color
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/qq.png',
                      fit: BoxFit.fitWidth, // Adjusted to fit the width
                      width: double.infinity, // Set width to take up the available space
                    ),
                    const SizedBox(height: 10.0), // Adjust the spacing between images
                    Image.asset(
                      'assets/ee.png',
                      fit: BoxFit.fitWidth, // Adjusted to fit the width
                      width: double.infinity, // Set width to take up the available space
                    ),
                  ],
                ),
              ),
            ),
            // Additional content can be added here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 4,
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
