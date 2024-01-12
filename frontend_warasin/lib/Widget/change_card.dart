import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class ChangeCard extends StatelessWidget {
  final bool isActive;
  final VoidCallback onPressed;
  final String title;
  final String description;

  ChangeCard({
    required this.title,
    required this.description,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: isActive ? 1.0 : 0.5,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(20),
            fixedSize: Size(MediaQuery.of(context).size.width - (2 * 50), 180),
            backgroundColor: successColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                description,
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
