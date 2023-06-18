import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  final void Function()? onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: onPressed,
          child: Text(buttonName),
        ),
      ),
    );
  }
}