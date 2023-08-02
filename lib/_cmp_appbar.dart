
import 'package:flutter/material.dart';


// add menu, orders, logout action buttons
AppBar app_bar(BuildContext context, String title){
  return AppBar(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
    title: Text(title),
    actions: [
      Row(
        children: [
          Text('Menu'),
          IconButton(
              icon: const Icon(Icons.menu_book),
              tooltip: 'View Menu',
              onPressed: () {}
          ),
        ],
      ),
      Row(
        children: [
          Text('Orders'),
          IconButton(
              icon: const Icon(Icons.star),
              tooltip: 'View Orders',
              onPressed: () {}
          ),
        ],
      ),
      Row(
        children: [
          Text('Logout'),
          IconButton(
              icon: const Icon(Icons.arrow_right),
              tooltip: 'Logout',
              onPressed: () {}
          ),
        ],
      ),
      const SizedBox(width: 20),
    ],
  );
}