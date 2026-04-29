import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/join_screen.dart';
import 'screens/learn_screen.dart';
import 'screens/events_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/blogs_screen.dart';
import 'screens/merchandise_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const SataranjiApp());
}

class SataranjiApp extends StatelessWidget {
  const SataranjiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sataranji Africa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F1F1F),
          brightness: Brightness.light,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AboutScreen(),
    const JoinScreen(),
    const LearnScreen(),
    const ContactScreen(),
  ];

  final List<String> _labels = ['Home', 'About', 'Join', 'Learn', 'Contact'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _labels.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(_getIcon(index)),
            label: _labels[index],
          ),
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.info;
      case 2:
        return Icons.person_add;
      case 3:
        return Icons.school;
      case 4:
        return Icons.phone;
      default:
        return Icons.home;
    }
  }
}
