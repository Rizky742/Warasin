import 'package:flutter/material.dart';
import 'package:warasin/Widget/logo_warasin_green.dart';
import 'package:warasin/theme.dart';

class Splash1Screen extends StatefulWidget {
  @override
  State<Splash1Screen> createState() => _Splash1ScreenState();
}

class _Splash1ScreenState extends State<Splash1Screen> {
  int currentIndex = 0;

  List images = [
    'assets/icon_splash1.png',
    'assets/icon_splash2.png',
    'assets/icon_splash3.png',
  ];

  List<String> titles = [
    'Terlalu Banyak Pikiran?',
    'Merasa Tidak Nyaman?',
    'Butuh Konseling?',
  ];

  List<String> descriptions = [
    '“Berikan dirimu izin untuk beristirahat.” Warasin dapat membantumu dalam memberikan tempat untuk mengistirahatkan pikiran!',
    '“Dalam ketenangan, temukan kekuatanmu.” Mari bergabung dengan Warasin untuk memberikan pelayanan yang terbaik untuk kenyamananmu!',
    '“Ingat, kamu tidak sendirian.” Warasin selalu ada, Mari perbaiki masalahmu!',
  ];

  void goToPreviousScreen() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void goToNextScreen() {
    if (currentIndex < images.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.only(right: 10),
        width: currentIndex == index ? 30 : 10,
        height: 9,
        decoration: BoxDecoration(
          color: currentIndex == index ? secondaryColor : backgroundColorGrey,
          borderRadius: BorderRadius.circular(1000),
        ),
      );
    }

    int index = -1;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColorWhite,
      body: Container(
        // color: backgroundColorGrey,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 72,
        ),
        child: Column(
          children: [
            LogoWarasinGreen(),
            SizedBox(
              height: 68,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: Column(
                children: [
                  Image.asset(
                    images[currentIndex],
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    titles[currentIndex],
                    style: primaryTextStyle.copyWith(
                      fontSize: 21,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    descriptions[currentIndex],
                    style: tertiaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: medium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => indicator(index),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex > 0)
                  IconButton(
                    onPressed: goToPreviousScreen,
                    icon: Icon(
                      Icons.chevron_left,
                      color: secondaryColor,
                      size: 50,
                    ),
                  ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: goToNextScreen,
                  icon: Icon(
                    Icons.chevron_right,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
