import 'package:flutter/material.dart';

class TotalAnalysis extends StatelessWidget {
  const TotalAnalysis({
    super.key,
    required this.totalSales,
    required this.totalOrders,
    required this.totalProducts,
  });

  final String totalSales;
  final String totalOrders;
  final String totalProducts;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Total Sales: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18, // Adjust the font size as needed
            ),
          ),
          TextSpan(
            text: totalSales,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18, // Adjust the font size as needed
            ),
          ),
          const TextSpan(text: '\n'),
          // Add a line break between the spans
          const TextSpan(
            text: 'Total Orders: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18, // Adjust the font size as needed
            ),
          ),
          TextSpan(
            text: totalOrders,
            style: const TextStyle(
              fontSize: 18, // Adjust the font size as needed
            ),
          ),
          const TextSpan(text: '\n'),
          // Add a line break between the spans
          const TextSpan(
            text: 'Total Products: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18, // Adjust the font size as needed
            ),
          ),
          TextSpan(
            text: totalProducts,
            style: const TextStyle(
              fontSize: 18, // Adjust the font size as needed
            ),
          ),
        ],
      ),
    );
  }
}