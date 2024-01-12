import 'package:flutter/material.dart';
import 'package:warasin/Widget/support_card.dart';
import 'package:warasin/models/support_card_model.dart';
import 'package:warasin/theme.dart';

class SupportScreen extends StatefulWidget {
  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  List<SupportCardModel> supportCardDataList = [
    SupportCardModel(
      description:
          'cenderung mencari dukungan dari sumber profesional, seperti konselor atau psikolog, daripada teman atau keluarga.',
      imagePath: 'assets/icon_ahli.png',
      title: 'Ahli Profesional',
    ),
    SupportCardModel(
      description:
          'cenderung mencari dukungan melalui komunitas online atau forum di internet.',
      imagePath: 'assets/icon_forum.png',
      title: 'Forum atau komunitas',
    ),
    SupportCardModel(
      description:
          'cenderung merasa tidak membutuhkan dukungan sosial saat ini.',
      imagePath: 'assets/icon_mandiri.png',
      title: 'Mandiri',
    ),
    SupportCardModel(
      description:
          'cenderung mencari dukungan dari kelompok atau komunitas yang memiliki fokus pada masalah atau tantangan tertentu.',
      imagePath: 'assets/icon_khusus.png',
      title: 'Kelompok Khusus',
    ),
    SupportCardModel(
      description:
          'cenderung merasa rumit atau sulit dengan keluarga atau teman',
      imagePath: 'assets/icon_keluarga.png',
      title: 'Hubungan sulit dengan keluarga atau teman',
    ),
    SupportCardModel(
      description:
          'cenderung mencari dukungan melalui aktivitas atau hobi yang saya senangi.',
      imagePath: 'assets/icon_hobbi.png',
      title: 'Aktivitas atau hobbi',
    ),
    SupportCardModel(
      description:
          'cenderung mencari dukungan dari komunitas agama atau spiritual saya.',
      imagePath: 'assets/icon_agama.png',
      title: 'Agama atau spiritual',
    ),
  ];

  @override
  void initState() {
    supportCardDataList[0].isActive = true;
    super.initState();
  }

  bool isAtLeastOneCardActive() {
    return supportCardDataList.any((card) => card.isActive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 72,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Apakah kamu memiliki dukungan sosial, seperti teman atau keluarga, yang dapat Anda ajak bicara?',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Silahkan Pilih...',
              style: tertiaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 50,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  supportCardDataList.length,
                  (index) => SupportCard(
                    supportCardModel: supportCardDataList[index],
                    onPressed: () {
                      setState(() {
                        supportCardDataList[index].isActive =
                            !supportCardDataList[index].isActive;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 50,
              right: 50,
              bottom: 72,
              top: 45,
            ),
            child: Row(
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
                    Navigator.pushNamed(context, '/problem');
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
                    if (isAtLeastOneCardActive()) {
                      Navigator.pushNamed(context, '/fill-profile');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: dangerColor,
                          duration: Duration(
                            milliseconds: 1500,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          showCloseIcon: true,
                          dismissDirection: DismissDirection.none,
                          content: Center(
                            child: Text(
                              'Setidaknya pilih 1 dukungan sosial!',
                              style: secondaryTextStyle.copyWith(
                                fontSize: 17,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
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
        ],
      ),
    );
  }
}
