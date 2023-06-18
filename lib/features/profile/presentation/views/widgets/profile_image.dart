import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.16,
        decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: AppColors.text1,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.white38.withOpacity(0.3),
              ),
            ]),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
        ),
      ),
    );
  }
}