import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class EmojiCard extends StatelessWidget {
  final bool isActive;
  final VoidCallback onPressed;
  final String emoji;
  final String expression;
  EmojiCard({
    required this.isActive,
    required this.onPressed,
    required this.emoji,
    required this.expression,
  });
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive ? 1 : 0.5,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: successColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 43,
          ),
        ),
        onPressed: onPressed,
        child: Column(
          children: [
            Image.asset(
              emoji,
              width: 70,
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              expression,
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
