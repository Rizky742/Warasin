import 'dart:async';

import 'package:flutter/material.dart';
import 'package:warasin/Widget/logo_warasin_green.dart';
import 'package:warasin/theme.dart';

enum Gender { Pria, Wanita, Lainnya }

enum Country { Indonesia, Malaysia, Thailand, Vietnam, Laos, Brunei }

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isPhoneNumberValid = false;
  bool isFullNameValid = false;
  Country? selectedCountry;
  Gender? selectedGender;

  onPhoneNumberChanged(String phoneNumber) {
    final phoneNumberRegex = RegExp(r'^[0-9]+$');
    setState(() {
      isPhoneNumberValid = false;
      if (phoneNumberRegex.hasMatch(phoneNumber)) {
        isPhoneNumberValid = true;
      }
    });
  }

  onFullNameChanged(String fullName) {
    final fullNameRegex = RegExp(r'^[a-zA-Z ]{5,}$');
    setState(() {
      isFullNameValid = false;
      if (fullNameRegex.hasMatch(fullName)) {
        isFullNameValid = true;
      }
    });
  }

  void onCountryChanged(Country? value) {
    setState(() {
      selectedCountry = value!;
    });
  }

  void onGenderChanged(Gender? value) {
    setState(() {
      selectedGender = value!;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      cancelText: 'Kembali',
      confirmText: 'Ok',
      barrierDismissible: false,
      errorFormatText: 'Tolong masukkan tanggal dengan benar!',
      errorInvalidText: 'Diluar jangkauan',
      fieldHintText: 'dd/mm/yyy',
      helpText: 'Pilih tanggal lahirmu...',
      keyboardType: TextInputType.datetime,
      fieldLabelText: 'Masukkan tanggal lahirmu',
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          dateController.text = '${picked.day}/${picked.month}/${picked.year}';
        },
      );
    } else {
      dateController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> showFailedDialog() async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Container(
          child: AlertDialog(
            backgroundColor: dangerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon_close.png',
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Gagal!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Oops..! Coba chek lagi',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: backgroundColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 47,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Kembali',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Future<void> showSuccessDialog() async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Container(
          child: AlertDialog(
            backgroundColor: successColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon_check.png',
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Terima Kasih!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Biodata kamu sudah terisi!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: backgroundColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 36,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                    child: Text(
                      'Dashboard',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 72,
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWarasinGreen(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Langkah terakhir, lengkapi biodata mu...',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 37,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: fullNameController,
                onChanged: onFullNameChanged,
                autocorrect: false,
                cursorColor: primaryTextColor,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon_profile.png',
                        fit: BoxFit.cover,
                        width: 20,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Nama Lengkap',
                  hintStyle: quarterTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: isFullNameValid
                  ? null
                  : !isFullNameValid && fullNameController.text.isNotEmpty
                      ? Text(
                          'Minimal 5 huruf dan tidak ada angka!',
                          style: dangerTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: regular,
                          ),
                        )
                      : null,
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: DropdownButtonFormField<Gender>(
                borderRadius: BorderRadius.circular(20),
                icon: Image.asset(
                  'assets/icon_gender.png',
                  width: 20,
                  fit: BoxFit.cover,
                ),
                value: selectedGender,
                onChanged: onGenderChanged,
                items: Gender.values
                    .map(
                      (gender) => DropdownMenuItem<Gender>(
                        value: gender,
                        child: Text(
                          gender.toString().split('.').last,
                          style: primaryTextStyle,
                        ),
                      ),
                    )
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Gender',
                  hintStyle: quarterTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: backgroundColorGrey,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Text(
                          dateController.text.isEmpty
                              ? 'Tanggal Lahir'
                              : dateController.text,
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: regular,
                            color: dateController.text.isEmpty
                                ? backgroundColorWhite
                                : primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Image.asset(
                          'assets/icon_date.png',
                          fit: BoxFit.cover,
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: DropdownButtonFormField<Country>(
                borderRadius: BorderRadius.circular(20),
                icon: Image.asset(
                  'assets/icon_country.png',
                  width: 20,
                  fit: BoxFit.cover,
                ),
                value: selectedCountry,
                onChanged: onCountryChanged,
                items: Country.values
                    .map(
                      (country) => DropdownMenuItem<Country>(
                        value: country,
                        child: Text(
                          country.toString().split('.').last,
                          style: primaryTextStyle,
                        ),
                      ),
                    )
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Negara',
                  hintStyle: quarterTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: phoneNumberController,
                onChanged: onPhoneNumberChanged,
                autocorrect: false,
                cursorColor: primaryTextColor,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon_call.png',
                        fit: BoxFit.cover,
                        width: 20,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Nomor Handphone',
                  hintStyle: quarterTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: isPhoneNumberValid
                  ? null
                  : !isPhoneNumberValid && phoneNumberController.text.isNotEmpty
                      ? Text(
                          'Tolong masukkan nomor dengan benar!',
                          style: dangerTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: regular,
                          ),
                        )
                      : null,
              height: 20,
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 132,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                if (!isFullNameValid ||
                    selectedGender == null ||
                    dateController.text.isEmpty ||
                    selectedCountry == null ||
                    !isPhoneNumberValid) {
                  showFailedDialog();
                } else {
                  showSuccessDialog();
                }
              },
              child: Text(
                'Selesai',
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
