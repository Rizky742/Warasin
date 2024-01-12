import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class LogoWarasinWhite extends StatelessWidget {
  const LogoWarasinWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo_warasin_white.png',
          width: 148,
          fit: BoxFit.cover,
        ),
        Text(
          'Warasin',
          style: logoTextStyleWhite.copyWith(
            fontWeight: bold,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
