import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class LogoWarasinGreenBig extends StatelessWidget {
  const LogoWarasinGreenBig({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo_warasin_green.png',
          width: 150,
          fit: BoxFit.cover,
        ),
        Text(
          'Warasin',
          style: logoTextStyleGreen.copyWith(
            fontSize: 30,
            fontWeight: bold,
          ),
        ),
      ],
    );
  }
}
