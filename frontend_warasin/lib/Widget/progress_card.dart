import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class ProgressCard extends StatelessWidget {
  final int amount;
  final String title;
  final String subTitle;
  ProgressCard({
    required this.amount,
    required this.title,
    this.subTitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColorYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 2.7,
        height: 195,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$amount',
                  style: quarterTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: semiBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Text(
                    ' x bulan ini',
                    style: quarterTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              title,
              style: quarterTextStyle.copyWith(
                fontSize: 17,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              subTitle,
              style: quarterTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
