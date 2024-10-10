import 'package:flutter/material.dart';
import 'screens/dashboard.dart'; // Import your dashboard.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins', // This sets Poppins as the default font
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Moved outside of textTheme
        useMaterial3: true, // Moved outside of textTheme
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w800, // Extra bold text
            color: Colors.black, // Extra black text color
          ),
        ),
      ),
      home: const DashboardPage(), // Set DashboardPage as the home widget
    );
  }
}
