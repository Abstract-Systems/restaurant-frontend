

// Author: Mujtaba (@mujtaba-io)
// Date: August 1, 2023

// Model class to hold data for a menu item.

/*
  Notes:
  - Nil
*/

import 'dart:math';

class MenuItem {
  final int id;
  final String name;
  final bool isAvailable;
  final double price;
  final int quantity;
  final String imagePath; // New field to store local image path

  MenuItem({
    required this.id,
    required this.name,
    required this.isAvailable,
    required this.price,
    required this.quantity,
    required this.imagePath,
  });
}

