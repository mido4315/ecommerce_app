import 'package:flutter/material.dart';

class AppAssets {
  static const String appleLogo = 'assets/images/apple.png';
  static const String googleLogo = 'assets/images/google.png';
  static const List<String> testImages = [
    'https://m.media-amazon.com/images/I/61sCd6EWexL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/61lLCq8wlPL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/71ncyN6TByL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/71yMGkX8M9L._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/71LH0z75dSL._SX3000_.jpg',
  ];
  static const List<Map<String, String>> categoriesIcons = [
    {
      'category': 'Laptop',
      'icon': 'assets/icons/laptop.png',
    },
    {
      'category': 'Hard Drives',
      'icon': 'assets/icons/hard-drive-device.png',
    },
    {
      'category': 'RAM',
      'icon': 'assets/icons/ram-memory.png',
    },
    {
      'category': 'Graphics Cards',
      'icon': 'assets/icons/graphic-card.png',
    },
    {
      'category': 'Monitor',
      'icon': 'assets/icons/monitor.png',
    },
    {
      'category': 'SSDs',
      'icon': 'assets/icons/ssd-drive.png',
    },
    {
      'category': 'Printer',
      'icon': 'assets/icons/printer.png',
    },
    {
      'category': 'Cables and Connectors',
      'icon': 'assets/icons/cable-connector.png',
    },
    {
      'category': 'Power Supplies',
      'icon': 'assets/icons/power-supply.png',
    },
  ];

  static String getStatus(int value) {
    switch (value) {
      case 0:
        return "preparing";
      case 1:
        return "Preparing";
      case 2:
        return "Ready";
      case 3:
        return "On Way";
      case 4:
        return "Completed";
      default:
        return "preparing";
    }
  }

  static Color? getStatusColor(int value) {
    switch (value) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.yellowAccent;
      case 3:
        return Colors.deepOrange;
      case 4:
        return Colors.red;
      default:
        return Colors.green;
    }
  }
}