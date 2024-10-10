import 'package:flutter/material.dart';
import 'package:scale/nest/weighthub.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                width: ss.width * 0.35,
                child: SizedBox(
                  height: 40,
                  child: DropdownButtonFormField<String>(
                    hint: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Commodity",
                        style: TextStyle(fontSize: 12),
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
                              fontSize: 16,
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
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    ),
                    isExpanded: true,
                  ),
                ),
              ),
              SizedBox(height: 20),

              
              Container(
                width: ss.width * 0.35,
                child: SizedBox(
                  height: 40,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      hint: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Select Variety", style: TextStyle(fontSize: 12)),
                      ),
                      items: ['Item 1', 'Item 2'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(value),
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
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      ),
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Switch(
                        value: isSwitched,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              WeighHub(),
              SizedBox(height: 20),
              Divider(thickness: 1, color: Colors.grey, height: 20),

              
              Expanded(
                child: ListView(
                  children: [
                    GradeItem(grade: 'Grade 1', price: 80.00, quantity: 50),
                    GradeItem(grade: 'Grade 2', price: 95.00, quantity: 75),
                    GradeItem(grade: 'Grade 3', price: 68.00, quantity: 40),
                    GradeItem(grade: 'Grade 3', price: 68.00, quantity: 40),
                    GradeItem(grade: 'Grade 3', price: 68.00, quantity: 40),
                    GradeItem(grade: 'Grade 3', price: 68.00, quantity: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical:8.0,horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Review'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 57, 56, 56),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () {
                },
                icon: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  color: Colors.black,
                  width: 54.0,
                  height: 54.0,
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
