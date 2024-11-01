import 'package:flutter/material.dart';
import 'package:scale/pages/addweight.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  int _numberOfCategories = 3;
  int _currentCategoryIndex = 0;
  TextEditingController _commodityController = TextEditingController();
  TextEditingController _fromKgController = TextEditingController();
  TextEditingController _toKgController = TextEditingController();
  bool _isButtonEnabled = false;
  List<Map<String, double>> _gradeWeights = [];

  final TextStyle _blackTextStyle = const TextStyle(color: Colors.black);

  @override
  void initState() {
    super.initState();
    _initializeGradeWeights();
  }

  void _initializeGradeWeights() {
    _gradeWeights = List.generate(_numberOfCategories, (index) => {'fromKg': 0, 'toKg': 0});
  }

  void _updateLabel(String value) {
    setState(() {
      _isButtonEnabled = value.isNotEmpty; // Enable button only if there's text
    });
  }

  void _saveWeights() {
    final fromKg = double.tryParse(_fromKgController.text) ?? 0;
    final toKg = double.tryParse(_toKgController.text) ?? 0;

    if (fromKg <= 0 || toKg <= fromKg) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid weight range. "From" must be less than "To" and greater than 0.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        _gradeWeights[_currentCategoryIndex] = {'fromKg': fromKg, 'toKg': toKg};
        _currentCategoryIndex++;
        _updateWeightControllers();

        if (_currentCategoryIndex >= _numberOfCategories) {
          _commodityController.clear();
          _isButtonEnabled = false;
        }
      });
    }
  }

  void _updateWeightControllers() {
    _fromKgController.text = '';
    _toKgController.text = '';
    _isButtonEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow resizing when keyboard opens
      appBar: AppBar(
        title: const Text(
          'Configuration',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView( // Wrap the entire body with a SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField and tick button row
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _commodityController,
                      decoration: InputDecoration(
                        hintText: 'Enter the new commodity name',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins',
                        ),
                        border: InputBorder.none,
                      ),
                      style: _blackTextStyle,
                      onChanged: (text) {
                        // Enable the button when there is text
                        setState(() {
                          _isButtonEnabled = text.isNotEmpty;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isButtonEnabled ? Colors.green : Colors.grey,
                  ),
                  child: IconButton(
                    iconSize: 20,
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: _isButtonEnabled
                        ? () {
                      // Logic for the tick button
                      print('Commodity name: ${_commodityController.text}');
                      if (_commodityController.text.isNotEmpty) {
                        // You can handle the saving logic here

                        // Keep the entered text in the field, but disable the button
                        setState(() {
                          _isButtonEnabled = false; // disable the button after saving
                        });
                      }
                    }
                        : null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16), // Gap between the text field and category section

            // No of categories section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No of categories',
                  style: _blackTextStyle.copyWith(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFE0E0E0),
                      ),
                      child: IconButton(
                        iconSize: 14,
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_numberOfCategories > 1) {
                              _numberOfCategories--;
                              if (_currentCategoryIndex >= _numberOfCategories) {
                                _currentCategoryIndex = _numberOfCategories - 1;
                              }
                              _initializeGradeWeights();
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF6F6F6),
                      ),
                      child: Center(
                        child: Text(
                          '$_numberOfCategories',
                          style: _blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFE0E0E0),
                      ),
                      child: IconButton(
                        iconSize: 14,
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _numberOfCategories++;
                            _initializeGradeWeights();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16), // Gap after the category section

            // Dynamic weight entry
            if (_currentCategoryIndex < _numberOfCategories)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Grade ${_currentCategoryIndex + 1} weight:',
                    style: _blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 8), // Gap before the weight input fields
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _fromKgController,
                          decoration: const InputDecoration(
                            labelText: 'From (kg)',
                          ),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _isButtonEnabled = value.isNotEmpty && _toKgController.text.isNotEmpty;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16), // Gap between the from and to input fields
                      Expanded(
                        child: TextField(
                          controller: _toKgController,
                          decoration: const InputDecoration(
                            labelText: 'To (kg)',
                          ),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _isButtonEnabled = value.isNotEmpty && _fromKgController.text.isNotEmpty;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8), // Gap before the check button
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isButtonEnabled ? Colors.green : Colors.grey,
                        ),
                        child: IconButton(
                          iconSize: 20,
                          icon: const Icon(Icons.check, color: Colors.white),
                          onPressed: _isButtonEnabled ? _saveWeights : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 16), // Gap after the weight entry section

            // Display list of grade weights
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent, // Make the background transparent
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), // Ensure the children are clipped to the rounded edges
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFDDF2A0), // Background color for the cards
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the card background
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Soft shadow for depth
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(16), // Add padding around the ListView
                    shrinkWrap: true, // Allow ListView to size itself based on content
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling of the ListView
                    children: _gradeWeights.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, double> grade = entry.value;
                      return Card(
                        color: const Color(0xFF6DBE45),
                        elevation: 2, // Add elevation for shadow effect on the card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Rounded edges for the card
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              '${index + 1}', // Displaying the grade number
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            'Grade ${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            '${grade['fromKg']} kg - ${grade['toKg']} kg',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.edit), // Optional: Edit icon
                            onPressed: () {
                              // Add edit functionality here
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 120),
            // Gap after the weight entry section

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddWeight()),
                    );
                    // Cancel logic
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF181C14),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Save all categories logic
                  },
                  child: const Text(
                    'Save All',
                    style: TextStyle(
                      color: Color(0xFF181C14),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
