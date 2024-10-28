import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Import this for date formatting





class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  DateTime selectedDate = DateTime.now(); // Variable to hold the selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Wrap Column in SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select date:'),
                ElevatedButton(
                  onPressed: () {
                    // Open date picker
                    _selectDate(context);
                  },
                  child: Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
                ),
              ],
            ),
            SizedBox(height: 75),

            // Data Fields
            ReportField(label: 'Lot no :', value: 'Value'),
            ReportField(label: 'Agg Weight :', value: 'Value'),
            ReportField(label: 'Grade 1 :', value: 'Value'),
            ReportField(label: 'Grade 2 :', value: 'Value'),
            ReportField(label: 'Grade 3 :', value: 'Value'),
            ReportField(label: 'Grade 4 :', value: 'Value'),
            ReportField(label: 'Wastage :', value: 'Value'),

            SizedBox(height: 16),

            // Placeholder for graphical representation


            SizedBox(height: 16),

            // Download PDF Button

          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked; // Update selected date
      });
  }
}

class ReportField extends StatelessWidget {
  final String label;
  final String value;

  ReportField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
