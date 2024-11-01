import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WeighHub extends StatelessWidget {
  const WeighHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Column(children: [
        //********************************* */

        // *** first one on the road ****
        Column(children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/icons/crate.png',
            height: 30,
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
                        BorderRadius.circular(30.0),

                      ),
                      contentPadding: EdgeInsets.only(bottom: 10),
                    ),
                  )),
              SizedBox(width:35),
            ],
          ),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //**********************************88 */

              // Second poppin

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 29.0), // Adjust this value as needed
                    child: Image.asset(
                      'assets/icons/crate.png', // Image widget
                      height: 30,
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
                                fontWeight: FontWeight.bold),
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),


              // MAIN -SCale-SIUUUUUUUUUUUU !!****************
              Column(children: [
                SvgPicture.asset(
                  'assets/icons/weight-scale.svg',
                  width: 70,
                  height:50,

                ),
                SizedBox(height: 10,),

                Container(
                    height: 36,
                    width: 76,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(30.0),

                        ),
                        contentPadding: EdgeInsets.only(bottom: 10),
                      ),
                    )),
                SizedBox(width:5),
              ]),

              //******************************* */

              // third one on the block

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 37.0), // Adjust this value as needed
                    child: Image.asset(
                      'assets/icons/crate.png', // Image widget
                      height: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Move the TextField to the start of the Row
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
                        ),
                      ),
                      SizedBox(width: 5),
                      // Now place the "G3" container here
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
                    ],
                  ),

                ],
              ),

            ],
          ),
        ),

        //******************************* */

        // Fourth in the pit
        Column(children: [
          Image.asset(
            'assets/icons/crate.png',
            height: 30,
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
                        BorderRadius.circular(30.0),

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



          ),

          SizedBox(width: 8.0),
          Expanded(
            child: ListTile(
              title: Text(
                grade,
                style: TextStyle(fontSize: 16),
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