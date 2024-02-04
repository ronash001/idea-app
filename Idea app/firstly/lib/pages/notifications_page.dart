// notifications_page.dart

import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'charts_page.dart';
import 'create_page.dart';
import 'search_page.dart';
import 'profile_page.dart';

class NotificationCard extends StatelessWidget {
  final String message;

  const NotificationCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.notifications, size: 30.0),
            ),
            SizedBox(width: 8.0),
            Text('Notifications'),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, size: 33.0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            height: 2.0,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NotificationCard(message: '"New Like" Adam Harvey liked your post'),
          NotificationCard(message: '"New Like" Bill Mcman liked your post'),
          NotificationCard(message: '"New Comment" Henry Bill commented on your post 3'),
          NotificationCard(message: '"New Share" Adam Harvey shared your post'),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ChartsPage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CreatePage()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
              break;
            case 4:
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
