import 'package:comic_world/user/view/cart_screen.dart';
import 'package:comic_world/user/view/favourite_screen.dart';
import 'package:comic_world/user/view/home_screen.dart';
import 'package:comic_world/user/view/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   int curruentIndex=0;

  List screens=[
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  void _ontap(int index){
    setState(() {
      curruentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[curruentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey ,
        currentIndex: curruentIndex,
        onTap: _ontap,
        items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorite"),
         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
      ]),
    );
  }
}