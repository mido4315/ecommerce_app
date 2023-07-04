import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader(
      this.text, {
        super.key,
      });

  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}