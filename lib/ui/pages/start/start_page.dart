import 'package:flutter/material.dart';
import 'package:normandy_aviatrainer/ui/pages/login/login_page.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<MenuItem> menu = [
    MenuItem(name: 'Обучение', isSelected: true),
    MenuItem(name: 'Тренажер'),
    MenuItem(name: 'Экзамен'),
    MenuItem(name: 'Инфографика'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 300,
            color: Color(0xFF005ECC),
            padding: EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/logo-white.png',
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(height: 40),
                Expanded(
                  child: ListView.builder(
                    itemCount: menu.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () => setState(() {
                        menu.forEach((element) {
                          element.isSelected = false;
                        });
                        menu[index].isSelected = true;
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                            color: menu[index].isSelected
                                ? Color(0xFF006EF0)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          menu[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: menu[index].isSelected
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  child: Text(
                    'Выйти',
                    style: TextStyle(
                      // color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Color(0xFF121010),
                    backgroundColor: Colors.white,
                    onSurface: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 24),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem {
  final String name;

  bool isSelected;
  MenuItem({
    required this.name,
    this.isSelected = false,
  });
}
