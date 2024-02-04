// create_page.dart

import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'charts_page.dart';
import 'search_page.dart';
import 'profile_page.dart';
import 'menu_page.dart'; // Import your MenuPage

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  List<Widget> photos = [];
  List<Widget> textFields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.add, size: 30.0),
            ),
            SizedBox(width: 8.0),
            Text('Create'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Title:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextField(
                maxLines: null, // Set maxLines to null for expanding
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Enter your post title...',
                ),
              ),
              SizedBox(height: 16.0), // Add spacing between the TextField and images
              // Display added photos
              Wrap(
                children: photos,
              ),
              SizedBox(height: 16.0), // Add spacing between images and text fields
              // Display added text fields
              Column(
                children: textFields,
              ),
              SizedBox(height: 16.0), // Add spacing between text fields and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle the +Photo button press
                      setState(() {
                        photos.add(Image.asset('assets/rr.png')); // Replace 'assets/rr.png' with your image path
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Button background color
                      onPrimary: Colors.black, // Text color
                    ),
                    child: Text('+Photo'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the +Video button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Button background color
                      onPrimary: Colors.black, // Text color
                    ),
                    child: Text('+Video'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the +Text button press
                      setState(() {
                        textFields.add(
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              maxLines: null, // Set maxLines to null for expanding
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintText: 'Enter your text...',
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Button background color
                      onPrimary: Colors.black, // Text color
                    ),
                    child: Text('+Text'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the Post button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Button background color
                      onPrimary: Colors.black, // Text color
                    ),
                    child: Text('Post'),
                  ),
                ],
              ),
              // Add other content as needed
            ],
          ),
        ),
      ),
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
              // Do nothing as it's the current page
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
