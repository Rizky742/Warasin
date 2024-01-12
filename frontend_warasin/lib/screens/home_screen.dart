import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:warasin/Widget/progress_card.dart';
import 'package:warasin/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  List<dynamic> _berita = [
    {
      'image': 'berita1.png',
      'description':
          'Halo GenZ, Seberapa Sehatkah Mentalmu? Ini Cara Mendeteksinya dari Psikolog.',
    },
    {
      'image': 'berita2.png',
      'description': '10 Rekomendasi Musik Klasik yang Cocok untuk Relaksasi',
    },
    {
      'image': 'berita3.png',
      'description':
          'Introvert Susah Bergaul karena "Social Battery" Cepat Habis? Begini Kata Psikolog.',
    }
  ];

  @override
  Widget build(BuildContext context) {
    Widget buttonSidebar() {
      return Column(
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: backgroundColorWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: backgroundColorWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: backgroundColorWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: backgroundColorWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      );
    }

    void _handlePageNavigation(int pageIndex) {
      switch (pageIndex) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/ai');
          break;
        case 2:
          Navigator.pushNamed(context, '/konselor');
          break;
        case 3:
          Navigator.pushNamed(context, '/education');
          break;
        case 4:
          Navigator.pushNamed(context, '/profile');
      }
      setState(() {
        pageIndex = _pageIndex;
        print(pageIndex);
      });
    }

    Widget buttonNavigationBar() {
      return CurvedNavigationBar(
        // onTap: (index) {
        //   _handlePageNavigation(index);
        // },
        color: primaryColor,
        animationCurve: Curves.easeOutQuart,
        backgroundColor: Colors.transparent,
        items: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_home.png',
              fit: BoxFit.cover,
              width: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_ai.png',
              fit: BoxFit.cover,
              width: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_konselor.png',
              width: 22,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_lamp.png',
              fit: BoxFit.cover,
              width: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icon_profile.png',
              fit: BoxFit.cover,
              width: 22,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColorWhite,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height + 234,
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                  left: 30,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: buttonSidebar(),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      'Hi, Budi',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 30,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Sekarang adalah waktu yang tepat untuk memperbaiki masalahmu!',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: backgroundColorWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 18),
                            width: 60,
                            height: 10,
                            decoration: BoxDecoration(
                              color: backgroundColorGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Yang lagi rame nih...',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                'See all',
                                style: tertiaryTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        CarouselSlider(
                          items: _berita.map(
                            (item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: successColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.asset(
                                                  'assets/${item['image']}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                width: 150,
                                                child: Text(
                                                  item['description'],
                                                  style:
                                                      quarterTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: medium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ).toList(),
                          options: CarouselOptions(
                            height: 134,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.75,
                            enlargeCenterPage: true,
                          ),
                        ),
                        SizedBox(
                          height: 42,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            '“Penyakit kamu bukanlah identitasmu.\nChemistry bukanlah karaktermu.”\n−Rick Warren.',
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pantau progressmu yuk!!',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                'See all',
                                style: tertiaryTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                ProgressCard(
                                  amount: 10,
                                  title: 'Jumlah Komunikasi Dengan A.I',
                                  subTitle: 'Sepertinya anda senang bercerita',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ProgressCard(
                                  amount: 5,
                                  title: 'Konsultasi Dengan Para Ahli',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                ProgressCard(
                                  amount: 3,
                                  title: 'Modul Pembelajaran Yang Dibuka',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: backgroundColorYellow,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    height: 195,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Konselor Favoritmu Bulan Ini!!',
                                          style: quarterTextStyle.copyWith(
                                            fontSize: 15,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Image.asset(
                                            'assets/icon_konselor_fav.png',
                                            width: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Text(
                                            'Dr. Discordus',
                                            style: quarterTextStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: medium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buttonNavigationBar(),
    );
  }
}
