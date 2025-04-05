import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // For date formatting

class SetVacationPage extends StatefulWidget {
  @override
  _SetVacationPageState createState() => _SetVacationPageState();
}

class _SetVacationPageState extends State<SetVacationPage> {
  DateTime? _startDate;
  DateTime? _endDate;

  // Format the date to display in the text fields
  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // Show Date Picker and set the date for start date or end date
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900); // Minimum selectable date
    DateTime lastDate = DateTime(2100); // Maximum selectable date

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null && selectedDate != _startDate && selectedDate != _endDate) {
      setState(() {
        if (isStartDate) {
          _startDate = selectedDate;
        } else {
          _endDate = selectedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Vacation'),
        backgroundColor: Colors.blue[800]!,  // Dark blue AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Your Vacation Dates:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800]!, // Blue color for the heading
              ),
            ),
            SizedBox(height: 20),

            // Start Date
            Text('Start Date:', style: TextStyle(fontSize: 18, color: Colors.black)),
            GestureDetector(
              onTap: () => _selectDate(context, true),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200]!,  // Light grey background for text fields
                    labelText: _startDate == null ? 'Select Start Date' : _formatDate(_startDate!),
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!, width: 2),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // End Date
            Text('End Date:', style: TextStyle(fontSize: 18, color: Colors.black)),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200]!,  // Light grey background for text fields
                    labelText: _endDate == null ? 'Select End Date' : _formatDate(_endDate!),
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!, width: 2),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_startDate != null && _endDate != null && _endDate!.isAfter(_startDate!)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Vacation dates set successfully!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select valid vacation dates!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700]!, // Blue button color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Rounded corners
                ),
                child: Text('Set Vacation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
