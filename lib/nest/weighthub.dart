import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeighHub extends StatefulWidget {
  const WeighHub({Key? key}) : super(key: key);

  @override
  _WeighHubState createState() => _WeighHubState();
}

class _WeighHubState extends State<WeighHub> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _controllerG3;
  late Animation<double> _animationG3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

     _controllerG3 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationG3 = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controllerG3, curve: Curves.easeInOut),
    );
  }

  void _triggerAnimation() {
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }
  void _triggerAnimationG3() {
    _controllerG3.forward().then((_) {
      _controllerG3.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerG3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Top Crate
          Column(
            children: [
              ScaleTransition(
                scale: _animation,
                child: Image.asset(
                  'assets/icons/crate.png',
                  height: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF242323),
                    ),
                    child: Center(
                      child: Text(
                        'G1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    height: 24,
                    width: 56,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        contentPadding: EdgeInsets.only(bottom: 10),
                      ),
                      onChanged: (value) {
    if (value.isNotEmpty) {
      _triggerAnimation();
    }
  },
                    ),
                  ),
                  SizedBox(width: 35),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Crate
                Column(
                  children: [
                    ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        'assets/icons/crate.png',
                        height: 50,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF242323),
                          ),
                          child: Center(
                            child: Text(
                              'G2',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 24,
                          width: 56,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              contentPadding: EdgeInsets.only(bottom: 10),
                            ),
                            onChanged: (value) {
    if (value.isNotEmpty) {
      _triggerAnimation();
    }
  },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Scale
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/weight-scale.svg',
                      width: 100,
                      height: 90,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 36,
                      width: 76,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.only(bottom: 10),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),

                // Right Crate
                Column(
                  children: [
                    ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        'assets/icons/crate.png',
                        height: 50,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF242323),
                          ),
                          child: Center(
                            child: Text(
                              'G3',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 24,
                          width: 56,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              contentPadding: EdgeInsets.only(bottom: 10),
                            ),
                            onChanged: (value) {
    if (value.isNotEmpty) {
      _triggerAnimation();
    }
  },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),


          // Bottom Crate
          Column(
            children: [
              ScaleTransition(
                scale: _animationG3,
                child: Image.asset(
                  'assets/icons/crate.png',
                  height: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF242323),
                    ),
                    child: Center(
                      child: Text(
                        'G4',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    height: 24,
                    width: 56,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        contentPadding: EdgeInsets.only(bottom: 10),
                      ),
                      onChanged: (value) {
    if (value.isNotEmpty) {
      _triggerAnimationG3();
    }
  },
                    ),
                  ),
                  SizedBox(width: 35),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}










class GradeItem extends StatelessWidget {
  final String grade;
  final double price;
  final int quantity;

  GradeItem({required this.grade, required this.price, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 8.0, 
            height: 60.0, 
            color: Color(0xFFd9d9d9), 
          ),
          SizedBox(width: 8.0), 
          GestureDetector(
            onTap: () {
              print('Circular indicator tapped!');
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF242323),
              ),
              child: Center(
                child: Text(
                  'G1', 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0), 
          Expanded(
            child: ListTile(
              title: Text(
                grade,
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                '₹ $price.00',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Qty: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '$quantity kg',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF242323),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8), 
                  Icon(
                    Icons.arrow_right,
                    size: 32, // Icon size
                    color: Color(0xFF242323), 
                  ),
                ],
              ),
              onTap: () {
                
                print('ListTile tapped!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
