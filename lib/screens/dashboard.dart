import 'package:flutter/material.dart';

import 'configuration.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F9), // Updated background color
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFF6DBE45),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 40), // Space for status bar
                const Text(
                  'MATIC',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter', // Added font style
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Graphical representation of the data goes here',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Inter', // Added font style
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Lot details',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter', // Added font style
              ),
            ),
          ),
          const SizedBox(height: 10), // Reduce this gap
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('S.No', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter')),
                    Text('Date', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter')),
                    Text('Commodity', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter')),
                    Text('Weight', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter')),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFF8F9F9),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 3, // Three rows of dummy data
              padding: EdgeInsets.zero, // Remove any default padding
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  color: Color(0xFFF8F9F9),
                  indent: 16, // Same indent as the padding
                  endIndent: 16, // Same endIndent as the padding
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle row tap here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Row ${index + 1} clicked')),
                    );
                  },
                  child: Container(
                    color: const Color(0xFFF8F9F9), // Updated row background color
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${index + 1}', style: TextStyle(fontFamily: 'Inter')),
                            const Text('2024-09-12', style: TextStyle(fontFamily: 'Inter')),
                            Text('Commodity ${index + 1}', style: TextStyle(fontFamily: 'Inter')),
                            Text('${(index + 1) * 10} kg', style: TextStyle(fontFamily: 'Inter')),
                          ],
                        ),
                        const SizedBox(height: 8), // Gap before the divider
                        const Divider(
                          thickness: 1,
                          color: Color(0xFF6DBE45), // Divider color to match your design
                          indent: 16, // Same indent as the padding
                          endIndent: 16, // Same endIndent as the padding
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConfigurationPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: '',
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

