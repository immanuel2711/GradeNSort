import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import for Firebase
import 'package:firebase_auth/firebase_auth.dart'; // Import for Firebase Auth
import 'package:scale/pages/auth/signup.dart';
import 'package:scale/pages/dashboard.dart';
import 'package:scale/pages/configuration.dart';
import 'package:scale/pages/addweight.dart';
import 'package:scale/pages/report.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
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
      home: const AuthWrapper(), // Use AuthWrapper for authentication state
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // Check if user is signed in
          final User? user = snapshot.data;
          if (user != null) {
            return const MainPage(); // Navigate to MainPage if logged in
          } else {
            return  SignUpPage(); // Navigate to SignUpPage if not logged in
          }
        }
        return const Center(child: CircularProgressIndicator()); // Show loading indicator
      },
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
    // Add ConfigurationPage if you wish to use it
    // const ConfigurationPage(),
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
