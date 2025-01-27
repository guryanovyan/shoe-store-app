import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const MyBottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),

          GNav(
            color: Colors.grey,
            activeColor: Colors.grey[00],
            tabBackgroundColor: Colors.grey.shade400,
            tabBorderRadius: 30,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            onTabChange: (value) => onTabChange!(value),
          
            tabs: [
              GButton(icon: Icons.home, text: 'Shop', ),
              GButton(icon: Icons.shopping_cart, text: 'Cart',),
          ]),
        ],
      ),
    );
  }
}