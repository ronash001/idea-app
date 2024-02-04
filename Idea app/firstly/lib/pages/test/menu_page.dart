// menu_page.dart

import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: const Center(
        child: Text(
          'This is the Menu Page!',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
