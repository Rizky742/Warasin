import 'package:flutter/material.dart';
import 'package:warasin/Widget/logo_warasin_green_big.dart';
import 'package:warasin/theme.dart';

class Forget1Password extends StatefulWidget {
  const Forget1Password({super.key});

  @override
  State<Forget1Password> createState() => _Forget1PasswordState();
}

class _Forget1PasswordState extends State<Forget1Password> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool isEmailValid = false;

  onEmailChanged(String email) {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    setState(() {
      isEmailValid = false;
      if (emailRegex.hasMatch(email)) {
        isEmailValid = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> showResponseDialog() async {
      if (isEmailValid) {
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
                      'Silahkan cek email anda! (maaf sebelumnya jika fitur ini belum berjalan, jadi klik saja tombol dibawah...)',
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
                            context, '/forget2', (route) => false);
                      },
                      child: Text(
                        'Ganti Password',
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
    }

    ;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 72,
          ),
          // decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            children: [
              LogoWarasinGreenBig(),
              SizedBox(
                height: 83,
              ),
              Text(
                'Jika kamu lupa kata sandi, tidak perlu khawatir. Sederhananya, berikan kami alamat email kamu, dan kami akan mengirimkan email berisi tautan untuk mereset kata sandi sehingga kamu dapat membuat yang baru.',
                style: tertiaryTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
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
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (email) => onEmailChanged(email),
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
                            'Tolong masukkan email dengan benar',
                            style: dangerTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: regular,
                            ),
                          )
                        : null,
                height: 37,
              ),
              Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Icon(
                      Icons.chevron_left,
                      size: 50,
                      color: secondaryColor,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: 17,
                        horizontal: 49,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          showResponseDialog();
                        }
                      });
                    },
                    child: Text(
                      'Reset Password Link',
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
      ),
    );
  }
}
