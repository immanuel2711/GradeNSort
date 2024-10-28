import 'package:flutter/material.dart';
import 'package:scale/nest/weighthub.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale/pages/configuration.dart';

class AddWeight extends StatefulWidget {
  const AddWeight({Key? key}) : super(key: key);

  @override
  State<AddWeight> createState() => _AddWeightState();
}

class _AddWeightState extends State<AddWeight> {
  String? selectedCommodity;
  String? selectedVariety;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    Size ss = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Allow scrolling if content overflows
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Commodity Dropdown
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 35,
                        child: DropdownButtonFormField<String>(
                          hint: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Commodity",
                              style: TextStyle(fontSize: 10),  // Smaller font
                            ),
                          ),
                          items: ['Mango', 'Apple'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          value: selectedCommodity,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCommodity = newValue;
                            });
                          },
                          isDense: true,
                          decoration: InputDecoration(
                            labelText: 'Commodity',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 63, 62, 62),
                              fontSize: 12,  // Smaller label
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          ),
                          isExpanded: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Variety Dropdown
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 35,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            hint: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("Variety", style: TextStyle(fontSize: 10)),
                            ),
                            items: ['Item 1', 'Item 2'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(value, style: TextStyle(fontSize: 14)),
                                ),
                              );
                            }).toList(),
                            value: selectedVariety,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedVariety = newValue;
                              });
                            },
                            isDense: true,
                            decoration: InputDecoration(
                              labelText: 'Variety',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 63, 62, 62),
                                fontSize: 12,  // Smaller label
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            ),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Custom Switch with Label
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        isSwitched ? "Stop Recording" : "Start Recording",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSwitched = !isSwitched;
                          });
                        },
                        child: Container(
                          height: 30, // Height of the toggle button
                          width: 60, // Width of the toggle button
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), // Rounded corners
                            gradient: LinearGradient(
                              colors: isSwitched
                                  ? [Colors.green, Colors.lightGreenAccent]
                                  : [Colors.grey.shade400, Colors.grey.shade300],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                left: isSwitched ? 30 : 0, // Position of the toggle circle
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: 30, // Width of the toggle circle
                                  height: 30, // Height of the toggle circle
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color: isSwitched ? Colors.green : Colors.red, // Outline color
                                      width: 2, // Border width
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      isSwitched ? Icons.check : Icons.close,
                                      color: isSwitched ? Colors.green : Colors.red,
                                      size: 16, // Icon size
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),





                SizedBox(height: 15),
                WeighHub(),
                SizedBox(height: 15),
                Divider(thickness: 1, color: Colors.grey, height: 20),

                // List of Grades
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200.0),  // Set max height
                  child: ListView(
                    shrinkWrap: true, // Ensure the list doesn't overflow
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GradeItem(grade: 'Grade 1', price: 80.00, quantity: 50),
                      GradeItem(grade: 'Grade 2', price: 95.00, quantity: 75),
                      GradeItem(grade: 'Grade 3', price: 68.00, quantity: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Review', style: TextStyle(fontSize: 14)),  // Smaller button text
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 57, 56, 56),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),  // Smaller button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfigurationPage()),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  color: Colors.black,
                  width: 40.0,  // Smaller icon
                  height: 40.0,  // Smaller icon
                ),
                tooltip: 'Edit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy GradeItem widget to avoid undefined errors
class GradeItem extends StatelessWidget {
  final String grade;
  final double price;
  final int quantity;

  const GradeItem({
    Key? key,
    required this.grade,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Simple dark grey vertical line with rounded corners
          Container(
            width: 5, // Adjusted width
            height: 45, // Adjusted height for a balanced look
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              color: Colors.grey[800], // Dark grey color
            ),
            margin: EdgeInsets.only(right: 12), // Space between line and text
          ),
          // Grade information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grade,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4), // Spacing between title and subtitle
                Text(
                  'Price: \Rs.${price.toStringAsFixed(2)} | Quantity: $quantity kg',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

