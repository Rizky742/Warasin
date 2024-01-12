import 'package:flutter/material.dart';
import 'package:warasin/Widget/emoji_card.dart';
import 'package:warasin/theme.dart';

class FeelScreen extends StatefulWidget {
  @override
  State<FeelScreen> createState() => _FeelScreenState();
}

class _FeelScreenState extends State<FeelScreen> {
  int activeEmojiIndex = 0;
  // bool isEmojiHappyActive = true;
  // bool isEmojiSadActive = false;
  // bool isEmojiAngryActive = false;
  // bool isEmojiConfusedActive = false;

  void toggleEmojiSelection(int index) {
    setState(() {
      if (activeEmojiIndex == index) {
        activeEmojiIndex = -1;
      } else {
        activeEmojiIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 72,
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bagaimana perasaanmu saat ini?',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Row(
                  children: [
                    EmojiCard(
                      emoji: 'assets/emoji_senang.png',
                      expression: 'Senang',
                      isActive: activeEmojiIndex == 0,
                      onPressed: () {
                        toggleEmojiSelection(0);
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    EmojiCard(
                      emoji: 'assets/emoji_sedih.png',
                      expression: 'Sedih',
                      isActive: activeEmojiIndex == 1,
                      onPressed: () {
                        setState(() {
                          toggleEmojiSelection(1);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    EmojiCard(
                      emoji: 'assets/emoji_marah.png',
                      expression: 'Marah',
                      isActive: activeEmojiIndex == 2,
                      onPressed: () {
                        setState(() {
                          toggleEmojiSelection(2);
                        });
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    EmojiCard(
                      emoji: 'assets/emoji_bingung.png',
                      expression: 'Bingung',
                      isActive: activeEmojiIndex == 3,
                      onPressed: () {
                        setState(() {
                          toggleEmojiSelection(3);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Tuliskan alasanmu...',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 300,
              style: primaryTextStyle,
              autocorrect: false,
              cursorColor: primaryTextColor,
              maxLines: 5,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: 'Ketik disini...',
                hintStyle: primaryTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                    color: tertiaryTextColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: successColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: successColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 137,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/problem');
              },
              child: Text(
                'Lanjut',
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
