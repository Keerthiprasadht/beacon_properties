import 'package:flutter/material.dart';

import 'field_update_page.dart';

class FieldItem extends StatelessWidget {
  final String title;

  FieldItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: ListTile(
          title: Text(title),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FieldUpdatePage(title: title),
              ),
            );
          },
        ),
      ),
    );
  }
}
