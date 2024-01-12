import 'package:flutter/material.dart';
import 'package:warasin/Widget/logo_warasin_green_big.dart';
import 'package:warasin/theme.dart';

class Forget2Password extends StatefulWidget {
  const Forget2Password({super.key});

  @override
  State<Forget2Password> createState() => _Forget2PasswordState();
}

class _Forget2PasswordState extends State<Forget2Password> {
  bool isPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isPasswordEightCharacter = false;
  bool isPasswordHasUppercase = false;
  bool isNewPasswordValid = false;
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();

  onPasswordChanged(String password) {
    isPasswordEightCharacter = false;
    setState(() {
      if (password.length >= 8) {
        isPasswordEightCharacter = true;
      }

      RegExp passwordRegex = RegExp(r'[A-Z]');
      final passwordUppercaseValid = passwordRegex.hasMatch(password);
      isPasswordHasUppercase = false;
      if (passwordUppercaseValid) {
        isPasswordHasUppercase = true;
      }
    });
  }

  onNewPasswordChanged(String newPassword) {
    isNewPasswordValid = false;
    setState(() {
      if (newPassword.length >= 8 && newPassword == passwordController.text) {
        isNewPasswordValid = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                horizontal: 70,
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
                    height: 11,
                  ),
                  Text(
                    'Berhasil!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Password kamu baru!',
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
                      padding: EdgeInsets.all(11),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    },
                    child: Text(
                      'Kembali ke Login',
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
                horizontal: 70,
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
                      padding: EdgeInsets.all(11),
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 72,
          horizontal: 50,
        ),
        child: Column(
          children: [
            LogoWarasinGreenBig(),
            SizedBox(
              height: 72,
            ),
            Text(
              'Masukkan Password Baru',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: regular,
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
                onChanged: (password) => onPasswordChanged(password),
                controller: passwordController,
                autocorrect: false,
                cursorColor: primaryTextColor,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Password',
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
                onChanged: (newPassword) => onNewPasswordChanged(newPassword),
                controller: newPasswordController,
                autocorrect: false,
                cursorColor: primaryTextColor,
                obscureText: !isNewPasswordVisible,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isNewPasswordVisible = !isNewPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isNewPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Konfirmasi Password',
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
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color:
                        isPasswordEightCharacter ? successColor : dangerColor,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(
                      isPasswordEightCharacter ? Icons.check : Icons.close,
                      color: backgroundColorWhite,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Password minimal 8 karakter',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: isPasswordHasUppercase ? successColor : dangerColor,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(
                      isPasswordHasUppercase ? Icons.check : Icons.close,
                      color: backgroundColorWhite,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Password minimal 1 huruf kapital',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: isNewPasswordValid ? successColor : dangerColor,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(
                      isNewPasswordValid ? Icons.check : Icons.close,
                      color: backgroundColorWhite,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Konfirmasi password tidak sesuai',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 132,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                if (isPasswordEightCharacter &&
                    isPasswordHasUppercase &&
                    isNewPasswordValid) {
                  showSuccessDialog();
                } else {
                  showFailedDialog();
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
