import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
         decoration: BoxDecoration(
           border: Border.all(
             color: Colors.black12,
             width: 2.5.w
           ),
           borderRadius: BorderRadius.circular(5),
           color: Colors.white,
         ),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}