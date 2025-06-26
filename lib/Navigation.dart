
import 'package:flutter/material.dart';
import 'package:flutter_projets/screens/favorites_screen.dart';
import 'package:flutter_projets/screens/pharmacies_screen.dart';

import 'Home.dart';
import 'UserProfil.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          Center(child: HomeScreen()),
          Center(child: FavoritesScreen()),
          Center(child: PharmaciesScreen()),
          Center(child: ProfileScreen()),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.green,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        iconSize: 22,
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy_outlined),
            label: 'Pharmacies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),

        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.blue,
        selectedLabelStyle: TextStyle(color: Colors.green),
        onTap: _onItemTapped,
      ),
    );
  }
}



