

// Author: Mujtaba (@mujtaba-io)
// Date: August 1, 2023

// Home provides 2 paths: Path to costumer, and path to staff/admin.

/*
  Notes:
  - Animations are used to make the app look more lively.
*/


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/staff_dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          /*Image.asset(
            'cover.jpg',
            fit: BoxFit.cover,
          ),*/
          AnimatedBackgroundImage(),

          // Overlay with 10% transparency
          Container(
            color: Colors.black.withOpacity(0.8),
          ),

          // Content centered in the stack
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animated Title Text
                AnimatedTitleText(),

                SizedBox(height: 20),

                // Animated buttons
                AnimatedButtons(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


class AnimatedBackgroundImage extends StatefulWidget {
  @override
  _AnimatedBackgroundImageState createState() => _AnimatedBackgroundImageState();
}

class _AnimatedBackgroundImageState extends State<AnimatedBackgroundImage> {
  PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );

  List<String> coverImages = [
    'cover_a.jpg',
    'cover_b.jpg',
    'cover_c.jpg',
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Start the automatic sliding after 2 seconds
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < coverImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: coverImages.length,
      itemBuilder: (context, index) {
        return Image.asset(
          coverImages[index],
          fit: BoxFit.cover,
          alignment: Alignment.center,
        );
      },
    );
  }
}



class AnimatedTitleText extends StatefulWidget {
  @override
  _AnimatedTitleTextState createState() => _AnimatedTitleTextState();
}

class _AnimatedTitleTextState extends State<AnimatedTitleText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Column(
            children: [
              Text(
                "l'hôtel raciste",
                style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "The racist hotel provides delicious food and drinks.",
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ]
          )
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedButtons extends StatefulWidget {
  @override
  _AnimatedButtonsState createState() => _AnimatedButtonsState();
}

class _AnimatedButtonsState extends State<AnimatedButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(children:[
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(0, _animation.value),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade300,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text("I\'m Customer",  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
              ),
            ),
            SizedBox(width: 20),
            Transform.translate(
              offset: Offset(0, _animation.value),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StaffDashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade300,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text("I\'m Staff", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
              ),
            ),
          ],
        ),

          // copyright notice on footer (at the end on page
          Transform.translate(
            offset: Offset(0, _animation.value),
            child:  Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                "© 2023 The Racist Hotel. All rights reserved.",
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, _animation.value),
            child:  Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Privacy Policy | Terms of Use",
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ),
          ),

        ]
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}