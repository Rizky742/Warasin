import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class SplashCard extends StatelessWidget {
  const SplashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      child: Column(
        children: [
          Image.asset(
            'assets/icon_splash1.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Terlalu Banyak Pikiran?',
            style: primaryTextStyle.copyWith(
              fontSize: 21,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '“Berikan dirimu izin untuk beristirahat.” Warasin dapat membantumu dalam memberikan tempat untuk mengistirahatkan pikiran!',
            style: tertiaryTextStyle.copyWith(
              fontSize: 15,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
