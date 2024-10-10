import 'package:flutter/material.dart';
import 'package:scale/pages/addweight.dart';
import 'package:scale/nest/dummy.dart/dummy1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: AddWeight(),
    );
  }
}
