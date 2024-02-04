// home_page.dart

import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'search_page.dart'; // Import your SearchPage
import 'charts_page.dart'; // Import your ChartsPage
import 'create_page.dart'; // Import your CreatePage
import 'profile_page.dart'; // Import your ProfilePage
import 'notifications_page.dart'; // Import your NotificationsPage
import 'menu_page.dart'; // Import your MenuPage

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Icon(Icons.home, size: 30.0),
              ),
              SizedBox(width: 8.0),
              Text('Home'),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, size: 33.0),
              onPressed: () {
                // Navigate to NotificationsPage when the notification bell icon is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu, size: 33.0),
              onPressed: () {
                // Navigate to MenuPage when the menu icon is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
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
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        child: const Card(
                          elevation: 2.0,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: AssetImage('assets/p1.png'),
                                ),
                                SizedBox(width: 16.0),
                                Text(
                                  'Joe Graphman',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/ww.png', width: 700),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              _isLiked ? Icons.favorite : Icons.favorite_border,
                              color: _isLiked ? Colors.red : null,
                              size: 30.0, // Increase the size of the icon
                            ),
                            onPressed: () {
                              setState(() {
                                _isLiked = !_isLiked;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.comment,
                              size: 30.0, // Increase the size of the icon
                            ),
                            onPressed: () {
                              // Add functionality for the comment button
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.share,
                              size: 30.0, // Increase the size of the icon
                            ),
                            onPressed: () {
                              // Add functionality for the share button
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ];
        },
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your existing body code goes here
              // Replace this comment with your actual content
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              // Home
              // Add logic or navigate to the home screen
              break;
            case 1:
              // Charts
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChartsPage()),
              );
              break;
            case 2:
              // Create
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePage()),
              );
              break;
            case 3:
              // Search
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
              break;
            case 4:
              // Profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}
