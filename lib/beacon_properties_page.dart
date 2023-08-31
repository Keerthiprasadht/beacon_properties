import 'package:flutter/material.dart';

import 'field_item_page.dart';

class BeconPropertiesMaterialPage extends StatelessWidget {
  const BeconPropertiesMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar for the page
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.blue,
        title: const Text(
          'A0:11:23:45:67:E1',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      //body contains -> text(i.e beaconproperties) container with 3 fields
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Beacon Properties',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                    ),
                  ],
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),

                // Adding 3 fields to the container based on the title
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      FieldItem(title: 'Advertisement Interval'),
                      const Divider(color: Colors.grey),
                      FieldItem(title: 'Radio Tx Power\n-12 dBm'),
                      const Divider(color: Colors.grey),
                      FieldItem(title: 'Advertised Tx Power\n-12 dBm'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
