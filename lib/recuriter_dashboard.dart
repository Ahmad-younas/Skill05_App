import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_05/all_candidate.dart';
import 'package:skill_05/post_job.dart';
import 'package:skill_05/profile.dart';
import 'package:skill_05/setting.dart';
import 'package:skill_05/short_listed.dart';

class RecuriterDashboard extends StatefulWidget {
  const RecuriterDashboard({super.key});

  @override
  State<RecuriterDashboard> createState() => _RecuriterDashboardState();
}

class _RecuriterDashboardState extends State<RecuriterDashboard> {
  int _currentIndex = 0;

  // Screens for the bottom navigation
  List<Widget> _screens = [
        PostJob(),
        Profile(),
        Setting(),
        AllCandidate(),
        ShortListed()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'PostJob',
            backgroundColor: const Color(0xFF961208),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Candidate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'shortListed',
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
