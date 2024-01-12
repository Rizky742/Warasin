import 'package:flutter/material.dart';
import 'package:warasin/Widget/logo_warasin_green.dart';
import 'package:warasin/theme.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorWhite,
      body: Container(
        margin: EdgeInsets.only(
          top: 148,
          left: 50,
          right: 50,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/icon_greetings.png',
              width: 260,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Halo, Budi!',
              style: primaryTextStyle.copyWith(
                fontSize: 21,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Warasin akan memberikan beberapa pertanyaan buat kamu nih! Jangan di skip yah, agar Warasin bisa memberikan solusi untuk kamu!',
              style: tertiaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 120,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/feel');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mulai ',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 30,
                    color: secondaryTextColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            LogoWarasinGreen(),
          ],
        ),
      ),
    );
  }
}
