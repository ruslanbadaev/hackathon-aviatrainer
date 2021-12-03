import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:normandy_aviatrainer/resources/api_provider.dart';
import 'package:normandy_aviatrainer/ui/pages/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _loginController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 115),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Wrap(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Есть аккаунт? ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF242629),
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LoginPage(),
                            ),
                          ),
                          child: Text(
                            'Войти',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFF005FCF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 120),
                    Text(
                      'Добро пожаловать в Нормандию',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF242629),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Онлайн тренажёр для обучения операторов БПЛА',
                      style: TextStyle(
                        color: Color(0xFF242629),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 48),
                    TextField(
                      controller: _loginController,
                      decoration: InputDecoration(
                        labelText: "Логин",
                        fillColor: Color(0xFFF7F8FA),
                        filled: true,
                        isDense: true,
                        labelStyle: TextStyle(
                            color: Color(0xFF999999),
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Пароль",
                        fillColor: Color(0xFFF7F8FA),
                        filled: true,
                        isDense: true,
                        labelStyle: TextStyle(
                            color: Color(0xFF999999),
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextButton(
                      child: Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color(0xFF005FCF),
                          onSurface: Colors.grey,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          padding: EdgeInsets.symmetric(vertical: 24)),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                    SizedBox(height: 83),
                    Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFF005FCF),
            padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 70),
            child: Image.asset(
              'assets/shape.png',
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
