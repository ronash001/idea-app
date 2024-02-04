// charts_page.dart

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'create_page.dart';
import 'profile_page.dart';
import 'menu_page.dart'; // Import your MenuPage
import 'bottom_navigation.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({Key? key}) : super(key: key);

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  int _currentIndex = 1;

  List<Post> posts = [
    Post(
      title: "Unlocking the Secrets of Success: A Journey to Personal Growth",
      likes: 5,
    ),
    Post(
      title: "Embracing Change: Transform Your Life with These Simple Steps",
      likes: 8,
    ),
    Post(
      title: "Discover the Power of Positivity: Elevate Your Mindset Today",
      likes: 3,
    ),
    Post(
      title: "Inspirational Stories to Brighten Your Day and Ignite Your Spirit",
      likes: 12,
    ),
    Post(
      title: "Achieve Your Goals with These Proven Strategies – Start Today!",
      likes: 7,
    ),
    Post(
      title: "Wellness Wisdom: Nourish Your Body, Mind, and Soul",
      likes: 10,
    ),
    Post(
      title: "Mindfulness Moments: Finding Peace in a Busy World",
      likes: 15,
    ),
    Post(
      title: "Unleash Your Creativity: Sparking Innovation in Daily Life",
      likes: 6,
    ),
    Post(
      title: "The Road to Happiness: Small Acts of Kindness, Big Impact",
      likes: 9,
    ),
    Post(
      title: "Building Resilience: Overcoming Challenges and Thriving",
      likes: 11,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Sort the posts based on the number of likes
    posts.sort((a, b) => b.likes.compareTo(a.likes));

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.bar_chart, size: 30.0),
            ),
            SizedBox(width: 8.0),
            Text('Charts'),
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
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildCard(posts[index]);
        },
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCard(Post post) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          post.title,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        trailing: _buildLikeButton(post),
      ),
    );
  }

  Widget _buildLikeButton(Post post) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: post.likes > 0 ? Colors.red : null,
          ),
          onPressed: () {
            setState(() {
              post.likes++;
            });
          },
        ),
        Text('${post.likes}'),
      ],
    );
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
        // Charts (Current Page)
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
  }
}

class Post {
  final String title;
  int likes;

  Post({required this.title, required this.likes});
}
