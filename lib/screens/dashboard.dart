import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Bluetooth status:',
                    style: TextStyle(color: Colors.white),
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
              style: TextStyle(color: Colors.white),
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
                    Text('S.No', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Commodity', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Weight', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFA5A1A1),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Three rows of dummy data
              padding: EdgeInsets.zero, // Remove any default padding
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Handle row tap here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Row $index clicked')),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${index + 1}'),
                            const Text('2024-09-12'),
                            Text('Commodity ${index + 1}'),
                            Text('${(index + 1) * 10} kg'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // Increased gap between rows
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFA5A1A1),
                      indent: 16, // Same indent as the padding
                      endIndent: 16, // Same endIndent as the padding
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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

