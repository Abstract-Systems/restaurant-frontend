

// Author: Mujtaba (@mujtaba-io)
// Date: August 1, 2023

// Staff dashboard page.

/*
  Notes:
  - Nil
*/


import 'package:flutter/material.dart';
import 'package:restaurant_app/yard/menuitem_model.dart';

import 'package:flutter/material.dart';

import '_cmp_appbar.dart';

class StaffDashboard extends StatefulWidget {
  @override
  _StaffDashboardState createState() => _StaffDashboardState();
}

class _StaffDashboardState extends State<StaffDashboard> {
  final List<MenuItem> menuItems = [
    MenuItem(id: 1, name: "Special Indian Boiled Egg with extra sauce and chutney", isAvailable: true, price: 10.0, quantity: 5, imagePath: 'cover_a.jpg'),
    MenuItem(id: 2, name: "Delicious Item", isAvailable: false, price: 15.0, quantity: 3, imagePath: 'cover_a.jpg'),
    MenuItem(id: 3, name: "Tasty Option", isAvailable: true, price: 8.0, quantity: 7, imagePath: 'cover_c.jpg'),
    MenuItem(id: 4, name: "Chef's Special", isAvailable: true, price: 12.0, quantity: 10, imagePath: 'cover_b.jpg'),
    MenuItem(id: 5, name: "Veggie Delight", isAvailable: false, price: 5.0, quantity: 2, imagePath: 'cover_a.jpg'),
    MenuItem(id: 6, name: "Signature Dish", isAvailable: true, price: 20.0, quantity: 4, imagePath: 'cover_b.jpg'),
    MenuItem(id: 7, name: "Spicy Treat", isAvailable: true, price: 18.0, quantity: 8, imagePath: 'cover_c.jpg')

    // Add more items as needed
  ];


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context, 'Staff Dashboard'),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              FilterChip(onSelected: (value){}, label: Text('Specials')),
              FilterChip(onSelected: (value){}, label: Text('Desserts')),
              FilterChip(onSelected: (value){}, label: Text('Spicy')),
              FilterChip(onSelected: (value){}, label: Text('Unavailable')),
              FilterChip(onSelected: (value){}, label: Text('Available')),
            ],
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(children: [Icon(Icons.add), Text('Add Item')]),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const Spacer(),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Add your desired border properties here
                      borderRadius: BorderRadius.circular(8), // Optional: Add border radius to make it more visually appealing
                    ),
                    child: DropdownButton<String>(
                      value: 'Newest First', // sortingCriteria,
                      onChanged: (String? newValue) {
                        setState(() {
                          //sortingCriteria = newValue!;
                          // Call a function here to apply the selected sorting criteria
                        });
                      },
                      items: <String>[
                        'Newest First',
                        'Default',
                        'Name',
                        'Date',
                        'Priority',
                        // Add more sorting criteria as needed
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Optional: Add padding to adjust the child content
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                SizedBox(width: 16), // Add some space between the dropdown and the search field
                Flexible(
                  child: TextField(
                    onChanged: (value) {
                      // Filter search results and setState with only filtered items to be passed out of all items to data list
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      // Adjust the values as needed
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTableTheme(
                    data: DataTableTheme.of(context).copyWith(
                      dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      headingTextStyle: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                      dividerThickness: 1,
                    ),
                    child: DataTable(
                      dataRowMinHeight: 48,
                      dataRowMaxHeight: 128,
                      columnSpacing: 120,
                      columns: [
                        DataColumn(label: Text('#')),
                        DataColumn(label: Text('Image')), // Assuming there's an image associated with each item
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('Availability')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: menuItems.map((item) {
                        return DataRow(cells: [
                          DataCell(Text(item.id.toString())),
                          DataCell(
                            SizedBox(
                                width: 128,
                                height: 128,
                                child: Center(
                                  child: Image.asset(
                                    item.imagePath,
                                    width: 100, // Set the desired width of the image
                                    height: 100, // Set the desired height of the image
                                  ),
                                )
                            ),
                          ),
                          DataCell(Text(item.name)),
                          DataCell(Text(item.price.toString())),
                          DataCell(
                            // Replace DataCell with a Switch widget
                            Switch(
                              value: item.isAvailable, // Assuming isAvailable is a bool property in your data model
                              onChanged: (newValue) {
                                // Handle the switch state change here
                                // For now, you can just print the new value
                                print('Switch value changed: $newValue');
                              },
                              activeColor: Colors.green, // Set the color when the switch is ON
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Handle edit button press
                                    // For now, print the item name
                                    print('Edit ${item.name}');
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Handle delete button press
                                    // For now, print the item name
                                    print('Delete ${item.name}');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



}