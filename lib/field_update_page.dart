import 'package:flutter/material.dart';

class FieldUpdatePage extends StatefulWidget {
  final String title;

  FieldUpdatePage({required this.title});

  @override
  _FieldUpdatePageState createState() => _FieldUpdatePageState();
}

class _FieldUpdatePageState extends State<FieldUpdatePage> {
  final TextEditingController _controller = TextEditingController();
  String fieldValue = '';
  OverlayEntry? _overlayEntry;
  bool isValueValid = true;

  @override
  void initState() {
    super.initState();
    fieldValue = '';
  }

  String? validateInput(String value) {
    // Logic for validating the TextField input
    if (value.isEmpty) {
      return null;
    }
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return 'Please enter a valid numeric value.';
    } else if (parsedValue < 100 || parsedValue > 3000) {
      return 'Advertisement Interval must be between 100 and 3000ms.';
    }

    return null;
  }

  // Custom toast notification
  void showCustomToast(String message, bool isValueValid) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 20.0,
        width: 400.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      child: Icon(
                        isValueValid
                            ? Icons.check_circle
                            : Icons.do_not_disturb_on,
                        color: isValueValid ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        message,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    // giving delay for overlay
    Future.delayed(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
    });
  }

  // dispose method is ovverride ti remove the overlay entry
  @override
  void dispose() {
    // _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}',
          // It is based on the passed title
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 90,
      ),
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
              child: TextFormField(
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
                      OutlineInputBorder(borderSide: BorderSide(width: 0.0)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Displaying error message below the TextField
            validateInput(_controller.text) == null
                ? const SizedBox(height: 0)
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                    child: Text(
                      'Advertisement Interval must be between 100 and 3000ms',
                      style: TextStyle(color: Colors.red),
                    ),
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
              onPressed: () {
                if (_controller.text.isEmpty) {
                  setState(() {
                    isValueValid = false;
                  });
                  showCustomToast("Advertisement Interval Update Failed    ✖️",
                      isValueValid);
                } else if (validateInput(_controller.text) == null) {
                  setState(() {
                    fieldValue = '';
                    _controller.clear();
                    isValueValid = true; // Set to true when successful
                  });
                  showCustomToast(
                      "Advertisement Interval Updated     ✖️", isValueValid);
                } else {
                  setState(() {
                    isValueValid = false; // Set to false when there's an error
                  });
                  showCustomToast("Advertisement Interval Update Failed    ✖️",
                      isValueValid);
                }

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
//----------------------------------



