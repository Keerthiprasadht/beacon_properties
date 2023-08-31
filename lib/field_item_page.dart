import 'package:flutter/material.dart';

import 'field_update_page.dart';

class FieldItem extends StatelessWidget {
  final String title;

  FieldItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // based on the title it will navigates
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FieldUpdatePage(title: title),
            ),
          );
        },
      ),
    );
  }
}
