import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_05/AllRecuritedPostedJob.dart';
import 'package:skill_05/client_dashboard.dart';
import 'package:skill_05/portfolio.dart';

class clientBottomNavigation extends StatefulWidget {
  const clientBottomNavigation({super.key});

  @override
  State<clientBottomNavigation> createState() => _clientBottomNavigationState();
}

class _clientBottomNavigationState extends State<clientBottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const ClientDashboard(),
    const Portfilio()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF961208),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.white,),
            label: "",
            backgroundColor: const Color(0xFF961208),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2,color: Colors.white),
            label: ""
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}
