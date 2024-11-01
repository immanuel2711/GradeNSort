import 'package:flutter/material.dart';
// Import your configuration.dart file
import 'package:scale/pages/dashboard.dart';
import 'package:scale/pages/configuration.dart';
import 'package:scale/pages/addweight.dart';
import 'package:scale/pages/Report.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GradeNSort',
      theme: ThemeData(
        fontFamily: 'Poppins', // Sets Poppins as the default font
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w800, // Extra bold text
            color: Colors.black, // Black text color
          ),
        ),
      ),
      home: const MainPage(), // Set MainPage as the home widget
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Track selected tab

  // List of pages corresponding to the BottomNavigationBar items
  final List<Widget> _pages = [
    const DashboardPage(),
    const AddWeight(),
    ReportPage(),
    //const Placeholder(), // Placeholder for the third page, replace with your actual page
  ];

  // Method to handle tap on BottomNavigationBar items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle tab change
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Reports',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.6),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}