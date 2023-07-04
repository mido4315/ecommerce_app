
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';

TableRow tableRow({
  required index,
  required image,
  required amount,
  required int status,
  required int i,
}) {
  return TableRow(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 0.5),
      ),
    ),
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.network(
                image,
                width: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(index)
          ],
        ),
      ),
      Text(amount),
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppAssets.getStatusColor(status)),
            height: 10,
            width: 10,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(AppAssets.getStatus(status)),
        ],
      ),
      InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(100)),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: const Center(
            child: Text(
              "view",
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
      )
    ],
  );
}