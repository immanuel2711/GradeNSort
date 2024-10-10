import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WeighHub extends StatelessWidget {
  const WeighHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,

      child: Column(children: [
        //********************************* */  

        //First one on the road
        Column(children: [
          Image.asset(
            'assets/icons/crate.png',
            height: 50,
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
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(width: 5),
              Container(
                  height: 24,
                  width: 56,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Curved corners
                        //borderSide: BorderSide.none, // Remove border line
                      ),
                      contentPadding: EdgeInsets.only(bottom: 10),
                    ),
                  )),
                  SizedBox(width:35),
            ],
          ),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //**********************************88 */

              // Second poppin

              Column(children: [
                Image.asset(
                  'assets/icons/crate.png', //secong
                  height: 50,
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
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    SizedBox(width: 5),
                    Container(
                        height: 24,
                        width: 56,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30.0), // Curved corners
                              //borderSide: BorderSide.none, // Remove border line
                            ),
                            contentPadding: EdgeInsets.only(bottom: 10),
                          ),
                        )),
                    
                  ],
                ),
              ]),

              // MAIN -SCale-SIUUUUUUUUUUUU !!****************
              Column(children: [
                SvgPicture.asset(
  'assets/icons/weight-scale.svg', // Path to your SVG asset
  width: 100,
  height:90, // Specify width if needed
   // Specify height if needed
),
SizedBox(height: 10,),

                Container(
                    height: 36,
                    width: 76,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30.0), // Curved corners
                          //borderSide: BorderSide.none, // Remove border line
                        ),
                        contentPadding: EdgeInsets.only(bottom: 10),
                      ),
                    )),
                SizedBox(width:5),
              ]),

              //******************************* */

              // third one in the bloxck

              Column(children: [
                Image.asset(
                  'assets/icons/crate.png',
                  height: 50,
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
                                fontWeight: FontWeight.bold),
                          ), 
                        )),
                    SizedBox(width: 5),
                    Container(
                        height: 24,
                        width: 56,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30.0), // Curved corners
                              //borderSide: BorderSide.none, // Remove border line
                            ),
                            contentPadding: EdgeInsets.only(bottom: 10),
                          ),
                        )),
                  ],
                ),
              ]),
            ],
          ),
        ),

        //******************************* */

        // Fourth in the pit
         Column(children: [
          Image.asset(
            'assets/icons/crate.png',
            height: 50,
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
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(width: 5),
              Container(
                  height: 24,
                  width: 56,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Curved corners
                        //borderSide: BorderSide.none, // Remove border line
                      ),
                      contentPadding: EdgeInsets.only(bottom: 10),
                    ),
                  )),
                  SizedBox(width:35),
            ],
          ),
        ]),
        /************************************* */
      ]),
    );
  }
}





// Scale box widget for middle icon


// Grade Item Widget


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
            width: 8.0, // Width of the indication bar
            height: 60.0, // Height of the indication bar
            color: Color(0xFFd9d9d9), // Color of the indication bar
          ),
          SizedBox(width: 8.0), // Space between bar and the circular indicator
          GestureDetector(
            onTap: () {
              // Handle tap on the circular indicator
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
                  'G1', // Change this as needed
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0), // Space between circular indicator and text
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
                  SizedBox(width: 8), // Space between quantity and icon
                  Icon(
                    Icons.arrow_right,
                    size: 32, // Icon size
                    color: Color(0xFF242323), // Icon color
                  ),
                ],
              ),
              onTap: () {
                // Handle tap action on ListTile
                print('ListTile tapped!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
