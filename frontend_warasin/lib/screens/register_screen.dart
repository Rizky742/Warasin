import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warasin/Widget/logo_warasin_green_big.dart';
import 'package:warasin/providers/auth_provider.dart';
import 'package:warasin/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController(text: '');
  final namaController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool isVisible = false;
  bool isEmailValid = false;
  bool isUsernameValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Future<void> showResponseDialog() async {
      String nama = namaController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isNotEmpty && nama.isNotEmpty && password.isNotEmpty) {
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
                        Navigator.pushNamed(context, '/register');
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

    _handleRegister() async {
      if (namaController != null &&
          emailController != null &&
          passwordController != null &&
          namaController.text != null &&
          emailController.text != null &&
          passwordController.text != null) {
        bool registrationSuccess = await authProvider.register(
          nama: namaController.text,
          email: emailController.text,
          password: passwordController.text,
        );
        if (registrationSuccess) {
          await showResponseDialog();
          Navigator.pushNamed(context, '/login');
        } else {
          print('Registration failed');
        }
      }
    }

    onEmailChanged(String email) {
      if (emailController != null && email != null) {
        final emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
        setState(() {
          isEmailValid = false;
          if (emailRegex.hasMatch(email)) {
            isEmailValid = true;
          }
        });
      }
    }

    onUsernameChanged(String nama) {
      if (namaController != null && nama != null) {
        final namaRegex = RegExp(r'[0-9]');
        setState(() {
          isUsernameValid = false;
          if (namaRegex.hasMatch(nama)) {
            isUsernameValid = true;
          }
        });
      }
    }

    onPasswordChanged(String password) {
      if (passwordController != null && password != null) {
        RegExp passwordUppercaseRegex = RegExp(r'[A-Z]');
        final passwordUppercaseValid =
            passwordUppercaseRegex.hasMatch(password ?? '');
        setState(() {
          isPasswordValid = false;
          if (password.length >= 8 && passwordUppercaseValid) {
            isPasswordValid = true;
          }
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 50,
          // vertical: 72,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 72),
              child: LogoWarasinGreenBig(),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Selamat Datang di Warasin!',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: emailController,
                onChanged: (email) => onEmailChanged(email),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: validateEmail,
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
              child: isEmailValid
                  ? null
                  : !isEmailValid && emailController.text.isNotEmpty
                      ? Text(
                          'Tolong masukkan email dengan benar!',
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
              child: TextFormField(
                controller: namaController,
                onChanged: (nama) => onUsernameChanged(nama),
                // validator: validateUsername,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                cursorColor: primaryTextColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Nama',
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
              child: isUsernameValid
                  ? null
                  : !isUsernameValid && namaController.text.isNotEmpty
                      ? Text(
                          'Username minimal mengandung 1 angka!',
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
              child: TextFormField(
                controller: passwordController,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (password) => onPasswordChanged(password),
                // validator: (password) => password!.length <= 8
                //     ? 'Password minimal 8 karakter!'
                //     : null,
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
                        color: primaryTextColor,
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
              child: isPasswordValid
                  ? null
                  : !isPasswordValid && passwordController.text.isNotEmpty
                      ? Text(
                          'Password minimal 8 karakter,\nMinimal 1 huruf kapital!',
                          style: dangerTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: regular,
                          ),
                        )
                      : null,
              height: 40,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 127,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: _handleRegister,
              child: Text(
                'Register',
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: regular,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      ' Login!',
                      style: logoTextStyleGreen.copyWith(
                        fontSize: 15,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
