import 'package:flutter/material.dart';

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

    if (fromKg > 0 && toKg > fromKg) {
      setState(() {
        // Save the weights for the current grade
        _gradeWeights[_currentCategoryIndex] = {'fromKg': fromKg, 'toKg': toKg};
        // Move to the next grade
        _currentCategoryIndex++;

        // If there are more categories, update the input fields and enable the button
        if (_currentCategoryIndex < _numberOfCategories) {
          _updateWeightControllers();
        } else {
          // Clear input fields and disable button
          _commodityController.clear();
          _fromKgController.clear();
          _toKgController.clear();
          _isButtonEnabled = false;
          // Optionally: Show a success message or navigate away
        }
      });
    } else {
      // Optionally: Show an error message
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
      appBar: AppBar(
        title: const Text('Configuration'),
      ),
      body: Padding(
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
                        border: InputBorder.none,
                      ),
                      onChanged: _updateLabel,
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
                    }
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // No of categories section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'No of categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
            const SizedBox(height: 16),
            // Dynamic weight entry
            if (_currentCategoryIndex < _numberOfCategories)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Grade ${_currentCategoryIndex + 1} weight',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _fromKgController,
                          decoration: const InputDecoration(
                            labelText: 'From (kg)',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _isButtonEnabled = value.isNotEmpty && _toKgController.text.isNotEmpty;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: _toKgController,
                          decoration: const InputDecoration(
                            labelText: 'To (kg)',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _isButtonEnabled = value.isNotEmpty && _fromKgController.text.isNotEmpty;
                            });
                          },
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
                          onPressed: _isButtonEnabled ? _saveWeights : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _gradeWeights.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, double> grade = entry.value;
                  return Card(
                    color: Colors.lightGreen[100],
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text('Grade ${index + 1}'),
                      subtitle: Text(
                        '${grade['fromKg']} kg - ${grade['toKg']} kg',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Cancel logic
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save logic
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
