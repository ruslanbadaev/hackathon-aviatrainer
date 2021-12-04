import 'package:flutter/material.dart';
import 'package:normandy_aviatrainer/models/user.dart';
import 'package:normandy_aviatrainer/resources/api_provider.dart';

import 'package:normandy_aviatrainer/ui/pages/login/login_page.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key, required this.user}) : super(key: key);

  final User user;

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
      backgroundColor: Colors.white,
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
                    itemCount: widget.user.role == Role.admin
                        ? menu.length
                        : menu.length - 1,
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
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 26,
                    ),
                    SizedBox(width: 16),
                    Text(
                      '${widget.user.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    )
                  ],
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
          ),
          LearningSection(userRole: widget.user.role!)
        ],
      ),
    );
  }
}

class LearningSection extends StatelessWidget {
  const LearningSection({
    Key? key,
    required this.userRole,
  }) : super(key: key);

  final Role userRole;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 36, horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Лекции',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Color(0xFF121010),
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Wrap(
                runSpacing: 24,
                spacing: 24,
                children: [
                  for (final lecture in lectures)
                    Container(
                      width: 300,
                      height: 260,
                      decoration: BoxDecoration(
                          color: Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(24),
                      // margin: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            lecture.number,
                            style: TextStyle(
                              color: Color(0xFF005FCF),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 32),
                          Text(
                            lecture.title,
                            style: TextStyle(
                              color: Color(0xFF121010),
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            lecture.subtitle,
                            style: TextStyle(
                              color: Color(0xFF121010),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            child: Text(
                              'Просмотр',
                              style: TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(0xFF005FCF),
                              onSurface: Colors.grey,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 22),
                            ),
                            onPressed: () {
                              // Navigator.pushReplacement<void, void>(
                              //   context,
                              //   MaterialPageRoute<void>(
                              //     builder: (BuildContext context) =>
                              //         LoginPage(),
                              //   ),
                              // );
                            },
                          ),
                        ],
                      ),
                    ),
                  if (userRole == Role.admin)
                    Container(
                      width: 300,
                      height: 260,
                      decoration: BoxDecoration(
                          color: Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(24),
                      // margin: EdgeInsets.all(24),
                      child: Image.asset('assets/plus.png'),
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

class MenuItem {
  final String name;

  bool isSelected;
  MenuItem({
    required this.name,
    this.isSelected = false,
  });
}
