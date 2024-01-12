import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warasin/Widget/logo_warasin_green_big.dart';
import 'package:warasin/providers/auth_provider.dart';
import 'package:warasin/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Future<void> showResponseDialog() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isNotEmpty && password.isNotEmpty) {
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
                      height: 11,
                    ),
                    Text(
                      'Terima Kasih!',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      'Akun kamu telah terdaftar!',
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
                            context, '/greeting', (route) => false);
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
      } else {
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
                        Navigator.pushNamed(context, '/login');
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
    }

    _handleLogin() async {
      if (emailController != null &&
          passwordController != null &&
          emailController.text != null &&
          passwordController.text != null) {
        bool loginSuccess = await authProvider.login(
          email: emailController.text,
          password: passwordController.text,
        );
        if (loginSuccess) {
          await showResponseDialog();
          Navigator.pushNamed(context, '/greeting');
        } else {
          print('Login failed');
          showResponseDialog();
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 72,
        ),
        child: Column(
          children: [
            LogoWarasinGreenBig(),
            SizedBox(
              height: 75,
            ),
            Text(
              'Selamat Datang di Warasin!',
              style: primaryTextStyle.copyWith(
                fontSize: 21,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              'Jaga kesehatan mentalmu bersama Warasin!',
              style: tertiaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 37,
            ),
            Container(
              height: 60,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: emailController,
                autocorrect: false,
                cursorColor: primaryTextColor,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Email',
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
              width: 330,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: passwordController,
                autocorrect: false,
                cursorColor: primaryTextColor,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      color: primaryTextColor,
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
              height: 37,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 140,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: _handleLogin,
              child: Text(
                'Login',
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/forget1');
              },
              child: Text(
                'Lupa Password?',
                style: logoTextStyleGreen.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Tidak punya akun?',
                  style: primaryTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    ' Register!',
                    style: logoTextStyleGreen.copyWith(
                      fontSize: 15,
                      fontWeight: regular,
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
