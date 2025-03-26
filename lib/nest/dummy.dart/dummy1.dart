// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class WeighHub extends StatefulWidget {
//   const WeighHub({Key? key}) : super(key: key);

//   @override
//   _WeighHubState createState() => _WeighHubState();
// }

// class _WeighHubState extends State<WeighHub> with SingleTickerProviderStateMixin {
//   String selectedCrate = ''; // G1, G2, G3, G4
//   double liveWeight = 0.0; // Live weight display
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     simulateWeighingProcess();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   // Simulate the weighing process and crate selection
//   void simulateWeighingProcess() async {
//     // Random weights and categories for simulation
//     final weights = [4.0, 12.0, 18.0, 25.0];
//     final crates = ['G1', 'G2', 'G3', 'G4'];

//     for (int i = 0; i < weights.length; i++) {
//       await Future.delayed(const Duration(seconds: 2), () {
//         setState(() {
//           liveWeight = weights[i];
//           selectedCrate = crates[i];
//           _controller.forward(from: 0); // Trigger animation
//         });
//       });
//     }
//   }

//   // Determine crate position based on category
//   Offset getCratePosition(String crate) {
//     switch (crate) {
//       case 'G1': // North
//         return const Offset(0, -150);
//       case 'G2': // East
//         return const Offset(150, 0);
//       case 'G3': // South
//         return const Offset(0, 150);
//       case 'G4': // West
//         return const Offset(-150, 0);
//       default:
//         return const Offset(0, 0); // Default (center)
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Crates
//         Positioned(top: 50, child: _buildCrate('G1')), // North
//         Positioned(right: 50, child: _buildCrate('G2')), // East
//         Positioned(bottom: 50, child: _buildCrate('G3')), // South
//         Positioned(left: 50, child: _buildCrate('G4')), // West

//         // Weighing Machine
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               'assets/icons/weight-scale.svg',
//               width: 100,
//               height: 100,
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Live Weight: ${liveWeight.toStringAsFixed(1)} kg',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),

//         // Mango Animation
//         AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             final position = Offset.lerp(
//               const Offset(0, 0), // Start at the center
//               getCratePosition(selectedCrate), // End at the crate
//               _controller.value,
//             )!;
//             return Transform.translate(
//               offset: position,
//               child: child,
//             );
//           },
//           child: Image.asset(
//             'assets/icons/mango.png',
//             width: 40,
//             height: 40,
//           ),
//         ),
//       ],
//     );
//   }

//   // Build a crate widget with zoom animation
//   Widget _buildCrate(String crateId) {
//     final isSelected = selectedCrate == crateId;

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: isSelected ? 60 : 50,
//       height: isSelected ? 60 : 50,
//       child: Column(
//         children: [
//           Image.asset('assets/icons/crate.png', width: 50, height: 50),
//           SizedBox(height: 5),
//           Text(
//             crateId,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: isSelected ? Colors.green : Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class GradeItem extends StatelessWidget {
//   final String grade;
//   final double price;
//   final int quantity;

//   GradeItem({required this.grade, required this.price, required this.quantity});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Container(
//             width: 8.0, 
//             height: 60.0, 
//             color: Color(0xFFd9d9d9), 
//           ),
//           SizedBox(width: 8.0), 
//           GestureDetector(
//             onTap: () {
//               print('Circular indicator tapped!');
//             },
//             child: Container(
//               width: 32,
//               height: 32,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFF242323),
//               ),
//               child: Center(
//                 child: Text(
//                   'G1', 
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 8.0), 
//           Expanded(
//             child: ListTile(
//               title: Text(
//                 grade,
//                 style: TextStyle(fontSize: 16),
//               ),
//               subtitle: Text(
//                 '₹ $price.00',
//                 style: TextStyle(fontSize: 18),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: 'Qty: ',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                         TextSpan(
//                           text: '$quantity kg',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF242323),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 8), 
//                   Icon(
//                     Icons.arrow_right,
//                     size: 32, // Icon size
//                     color: Color(0xFF242323), 
//                   ),
//                 ],
//               ),
//               onTap: () {
//                 print('ListTile tapped!');
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
