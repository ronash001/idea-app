import 'package:flutter/material.dart';
import 'charts_page.dart';
import 'create_page.dart';
import 'search_page.dart';
import 'profile_page.dart';
import 'notifications_page.dart';
import 'login_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.menu, size: 30.0),
            ),
            SizedBox(width: 8.0),
            Text('Menu'),
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
            color: Colors.grey, // Adjust the color as needed
          ),
        ),
      ),
      body: ListView(
        children: [
          buildMenuCard(
            title: 'Home',
            icon: Icons.home,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          buildMenuCard(
            title: 'Charts',
            icon: Icons.bar_chart,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ChartsPage()),
              );
            },
          ),
          buildMenuCard(
            title: 'Create',
            icon: Icons.add,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CreatePage()),
              );
            },
          ),
          buildMenuCard(
            title: 'Search',
            icon: Icons.search,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          buildMenuCard(
            title: 'Profile',
            icon: Icons.person,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          buildMenuCard(
            title: 'Notifications',
            icon: Icons.notifications,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
          buildMenuCard(
            title: 'Sign Out',
            icon: Icons.exit_to_app,
            onTap: () {
              // Perform sign-out logic here
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildMenuCard({required String title, required IconData icon, required VoidCallback onTap}) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Icon(icon), // Set the icon to the left
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
