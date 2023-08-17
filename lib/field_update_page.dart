import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FieldUpdatePage extends StatefulWidget {
  final String title;

  FieldUpdatePage({required this.title});

  @override
  _FieldUpdatePageState createState() => _FieldUpdatePageState();
}

class _FieldUpdatePageState extends State<FieldUpdatePage> {
  final TextEditingController _controller = TextEditingController();
  String fieldValue = '';

  @override
  void initState() {
    super.initState();
    fieldValue = '';
  }

  String? validateInput(String value) {
    if (value.isEmpty) {
      return null;
    }

    // logic for the Textfield input
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return 'Please enter a valid numeric value.';
    } else if (parsedValue < 100 || parsedValue > 3000) {
      return 'Advertisement Interval must be between 100 and 3000ms.';
    }

    return null;
  }

  // Toast(notification)
  void showFloatingBar(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: backgroundColor,
      textColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}',
        ),
        toolbarHeight: 90,
      ),

      // body containes ->Text, Textfield, Button
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${widget.title}',
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 30,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.left,
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    fieldValue = value;
                  });
                },
                decoration: const InputDecoration(
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // showing error at the bottom of the textfield
            validateInput(_controller.text) == null
                ? const SizedBox(height: 0)
                : const Text(
                    'Advertisement Interval must be betweeen 100 to 3000ms',
                    style: TextStyle(color: Colors.red),
                  ),
            const SizedBox(height: 8),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              // On pressed property for the button
              onPressed: () {
                if (validateInput(_controller.text) == null) {
                  setState(() {
                    fieldValue = '';
                    _controller.clear();
                  });
                  showFloatingBar(
                      "Advertizement Interval Updated", Colors.white);
                } else {
                  showFloatingBar(
                      'Advertizement Interval Updated Failed', Colors.red);
                }

                // This is used to go back to previous page show notification there
                Navigator.pop(context);
              },
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
