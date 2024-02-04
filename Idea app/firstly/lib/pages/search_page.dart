// search_page.dart

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'charts_page.dart';
import 'create_page.dart'; // Import your CreatePage
import 'profile_page.dart'; // Import your ProfilePage
import 'menu_page.dart'; // Import your MenuPage

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allTopics = [
    'Healthcare Solution',
    'Water resource conservation',
    'Fireproof clothing',
    'Earthquake resistant buildings',
    'Smart Cow farming'
  ];
  List<String> filteredTopics = [];

  int _currentIndex = 3; // Set the initial index for the SearchPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.search, size: 30.0),
            ),
            SizedBox(width: 8.0),
            Text('Search'),
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            height: 2.0,
            color: Colors.grey, // Adjust the color as needed
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 15.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 202, 189, 189),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: onSearchTextChanged,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Color.fromARGB(255, 27, 26, 26)),
                    onPressed: () {
                      // Add any functionality you want when the search icon is pressed
                    },
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0, top: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Results:',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTopics.length,
              itemBuilder: (context, index) {
                return buildTopicCard(filteredTopics[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, size: 30.0),
              label: 'Charts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, size: 30.0),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30.0),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30.0),
              label: 'Profile',
            ),
          ],
          unselectedItemColor: const Color.fromARGB(255, 27, 26, 26),
          selectedItemColor: const Color.fromARGB(255, 182, 157, 14),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget buildTopicCard(String topic) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: ListTile(
        title: Text(topic),
        onTap: () {
          // Add any functionality you want when a card is tapped
        },
      ),
    );
  }

  void onSearchTextChanged(String value) {
    setState(() {
      filteredTopics = allTopics
          .where((topic) => topic.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChartsPage()),
        );
        break;
      case 2:
        // Navigate to CreatePage when the Create icon is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CreatePage()),
        );
        break;
      case 3:
        // Already on the Search page
        break;
      case 4:
        // Navigate to ProfilePage when the Profile icon is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }
}
