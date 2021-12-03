import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:normandy_aviatrainer/resources/api_provider.dart';
import 'package:normandy_aviatrainer/ui/pages/home_page/home.dart';
import 'package:normandy_aviatrainer/ui/pages/register/register_page.dart';
import 'package:normandy_aviatrainer/ui/pages/start/start_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isLoginCorrect = true;
  bool isPasswordCorrect = true;

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
                          'Еще нет аккаунта? ',
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
                                  const RegisterPage(),
                            ),
                          ),
                          child: Text(
                            'Зарегистрируйтесь',
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
                        // errorText:
                        //     isLoginCorrect ? null : 'Неверно указан логин',
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
                        // errorText:
                        //     isPasswordCorrect ? null : 'Неверно указан пароль',
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
                        'Войти',
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
                        setState(() {
                          isLoginCorrect = auth();
                          isPasswordCorrect = auth();
                        });
                        if (auth()) {
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => StartPage(),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    Text(
                      !isLoginCorrect || !isPasswordCorrect
                          ? 'Неверно указан логин или пароль'
                          : '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).errorColor,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(height: 50),
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

  bool auth() {
    for (final user in users) {
      if (_loginController.text == user.name &&
          _passwordController.text == user.password) {
        return true;
      }
    }
    return false;
  }
}
