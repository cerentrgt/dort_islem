import 'package:dort_islem/screens/LoginPage/PasswordChange.dart';
import 'package:dort_islem/screens/RegisterPage/RegisterScreen.dart';
import 'package:dort_islem/service/AuthService.dart';
import 'package:flutter/material.dart';

import '../homePage/MyHomePage/homePage/myHome.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();

  var authService = AuthService();

  @override
  void dispose() {
    txtEmail.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF5A74E6),
                Color(0xFF605DF5),
                Color(0xFF3D49B3),
                Color(0xFF0C1FCB),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Giriş Yap",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                buildEmail(),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sifre",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildPassWord(),
                    const SizedBox(
                      height: 10,
                    ),
                    passwordChange(),
                    const SizedBox(
                      height: 10,
                    ),
                    loginButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(children: const [
                        Text(
                          "- Ya da -",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    socialIcons(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildSignButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSignButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: "Hesabınız yok mu?  ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "Kaydolun ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        googleButton(),
      ],
    );
  }

  Widget googleButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          primary: const Color(0xFF4DA9FF),
          padding: const EdgeInsets.all(2),
        ),
        onPressed: () {
          authService.signInWithGoogle().then((value) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const myHome()));
          }).whenComplete(() => null);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/google-icon-logo.png",
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text("Google ile Giriş Yap")
            ],
          ),
        ));
  }

  Widget loginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF4DA9FF),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Giris Yap",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Icon(Icons.login),
          ],
        ),
        onPressed: () {
          if (txtEmail.text.isEmpty) {
            emailError();
          } else if (txtPassword.text.isEmpty) {
            passwordError();
          } else {
            authService.signIn(txtEmail.text, txtPassword.text).then((value) {
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const myHome()));
            });
          }
        },
      ),
    );
  }

  void passwordError() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: ((context, setState) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            backgroundColor: Colors.red,
            title: const Text(
              "Lütfen şifre alanını doldurun!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: const BorderSide(color: Colors.red)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text("Geri Dön"))
                ],
              )
            ],
          );
        }),
      ),
    );
  }

  void emailError() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: ((context, setState) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            backgroundColor: Colors.red,
            title: const Text(
              "Lütfen E-mail alanını doldurun!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: const BorderSide(color: Colors.red)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text("Geri Dön"))
                ],
              )
            ],
          );
        }),
      ),
    );
  }

  Widget passwordChange() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Sifremi Unuttum",
          style: TextStyle(color: Colors.white70),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PasswordChange(),
            ),
          );
        },
      ),
    );
  }

  Widget buildPassWord() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFF4DA9FF),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6.0,
            color: Colors.black26,
            offset: Offset(0, 2),
          )
        ],
      ),
      height: 60,
      child: TextField(
        controller: txtPassword,
        obscureText: true,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.password,
              color: Colors.white,
            ),
            hintText: "Sifre : ",
            hintStyle: TextStyle(color: Colors.white54)),
      ),
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "E-mail",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFF4DA9FF),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ]),
          child: TextField(
            controller: txtEmail,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: "E-mail :",
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        )
      ],
    );
  }
}
