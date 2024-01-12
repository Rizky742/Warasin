import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class LogoWarasinGreen extends StatelessWidget {
  const LogoWarasinGreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo_warasin_green.png',
          width: 100,
          fit: BoxFit.cover,
        ),
        Text(
          'Warasin',
          style: logoTextStyleGreen.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
      ],
    );
  }
}
