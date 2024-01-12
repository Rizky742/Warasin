import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:warasin/Widget/change_card.dart';
import 'package:warasin/theme.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  bool isChangeCard1Active = true;
  bool isChangeCard2Active = false;
  bool isChangeCard3Active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 72,
          horizontal: 50,
        ),
        child: Column(
          children: [
            Text(
              'Apa yang menjadi perubahan atau tantangan dalam hidup kamu belakangan ini?',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ChangeCard(
              isActive: isChangeCard1Active,
              onPressed: () {
                setState(() {
                  isChangeCard1Active = !isChangeCard1Active;
                  isChangeCard2Active = false;
                  isChangeCard3Active = false;
                });
              },
              title: 'Tidak ada perubahan signifikan',
              description:
                  'Kamu dalam keadaan yang relatif stabil dan tidak mengalami perubahan besar dalam pekerjaan, hubungan, atau kehidupan secara keseluruhan.',
            ),
            SizedBox(
              height: 16,
            ),
            ChangeCard(
              isActive: isChangeCard2Active,
              onPressed: () {
                setState(() {
                  isChangeCard2Active = !isChangeCard2Active;
                  isChangeCard1Active = false;
                  isChangeCard3Active = false;
                });
              },
              title: 'Ada beberapa perubahan pekerjaan atau hubungan',
              description:
                  'Kamu dalam keadaan mengalami perubahan baik positif maupun menantang.',
            ),
            SizedBox(
              height: 16,
            ),
            ChangeCard(
              isActive: isChangeCard3Active,
              onPressed: () {
                setState(() {
                  isChangeCard3Active = !isChangeCard3Active;
                  isChangeCard1Active = false;
                  isChangeCard2Active = false;
                });
              },
              title: 'Menghadapi tantangan besar',
              description:
                  'Kamu dalam keadaan menghadapi tantangan besar seperti kehilangan pekerjaan yang signifikan atau kehilangan orang yang dicintai.',
            ),
            Spacer(),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: secondaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 42,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/feel');
                  },
                  child: Text(
                    'Kembali',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 52,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/support');
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
          ],
        ),
      ),
    );
  }
}
