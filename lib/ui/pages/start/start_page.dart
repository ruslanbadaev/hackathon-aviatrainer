import 'package:flutter/material.dart';
import 'package:normandy_aviatrainer/models/category.dart';
import 'package:normandy_aviatrainer/models/lecture.dart';
import 'package:normandy_aviatrainer/models/user.dart';
import 'package:normandy_aviatrainer/resources/api_provider.dart';
import 'package:normandy_aviatrainer/ui/pages/home_page/home.dart';
import 'package:normandy_aviatrainer/ui/pages/lecture/lecture_page.dart';

import 'package:normandy_aviatrainer/ui/pages/login/login_page.dart';
import 'package:normandy_aviatrainer/ui/pages/simulation/simulation_page.dart';
import 'package:normandy_aviatrainer/ui/pages/trainer/trainer_page.dart';
import 'package:normandy_aviatrainer/ui/widgets/quiz_options.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<MenuItem> menu = [
    MenuItem(name: 'Обучение', isSelected: true, page: Pages.learning),
    MenuItem(name: 'Тренажер', page: Pages.training),
    MenuItem(name: 'Экзамен', page: Pages.exam),
    MenuItem(name: 'Инфографика', page: Pages.dashboard),
  ];

  Pages selectedPage = Pages.learning;

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
                        selectedPage = menu[index].page;
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
          getCurrentPage()
        ],
      ),
    );
  }

  Widget getCurrentPage() {
    switch (selectedPage) {
      case Pages.learning:
        return LearningSection(userRole: widget.user.role!);
      case Pages.training:
        return TrainerPage();
      case Pages.exam:
        return ExamSection(userRole: widget.user.role!);
      case Pages.dashboard:
        return LearningSection(userRole: widget.user.role!);
      default:
        return LearningSection(userRole: widget.user.role!);
    }
  }
}

class ExamSection extends StatefulWidget {
  const ExamSection({
    Key? key,
    required this.userRole,
  }) : super(key: key);

  final Role userRole;

  @override
  State<ExamSection> createState() => _ExamSectionState();
}

class _ExamSectionState extends State<ExamSection> {
  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return Container(
      width: 300,
      height: 290,
      decoration: BoxDecoration(
          color: Color(0xFFF7F8FA), borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(24),
      // margin: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'экзамен',
            style: TextStyle(
              color: Color(0xFF005FCF),
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 32),
          Text(
            category.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF121010),
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          // SizedBox(height: 24),
          // Text(
          //   exam.subtitle,
          //   style: TextStyle(
          //     height: 1.4,
          //     color: Color(0xFF121010),
          //     fontWeight: FontWeight.w400,
          //     fontSize: 16,
          //   ),
          // ),
          Spacer(),
          TextButton(
            child: Text(
              'Начать',
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
              _categoryPressed(context, category);
              // setState(() {
              //   isLectureShowing = true;
              //   selectedLecture = lecture;
              // });
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
    );

    // MaterialButton(
    //   elevation: 0.0,
    //   highlightElevation: 1.0,
    //   onPressed: () => _categoryPressed(context, category),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10.0),
    //   ),
    //   color: Colors.white,
    //   textColor: Colors.grey[400],
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       if (category.icon != null) Icon(category.icon),
    //       if (category.icon != null) SizedBox(height: 5.0),
    //       Text(
    //         category.name,
    //         textAlign: TextAlign.center,
    //         maxLines: 3,
    //         style: TextStyle(color: Colors.black.withOpacity(.7), fontSize: 16),
    //       ),
    //     ],
    //   ),
    // );
  }

  _categoryPressed(BuildContext context, Category category) {
    showDialog(
      context: context,
      builder: (sheetContext) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 300),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0))),
          // contentPadding: EdgeInsets.only(top: 10.0),
          content: QuizOptionsDialog(
            category: category,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 36, horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Экзамены',
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
                  for (int i = 0; i < categories.length; i++)
                    _buildCategoryItem(context, i),
                  // Container(
                  //   width: 300,
                  //   height: 290,
                  //   decoration: BoxDecoration(
                  //       color: Color(0xFFF7F8FA),
                  //       borderRadius: BorderRadius.circular(12)),
                  //   padding: EdgeInsets.all(24),
                  //   // margin: EdgeInsets.all(24),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     children: [
                  //       Text(
                  //         exam.number,
                  //         style: TextStyle(
                  //           color: Color(0xFF005FCF),
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 12,
                  //         ),
                  //       ),
                  //       SizedBox(height: 32),
                  //       Text(
                  //         exam.title,
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(
                  //           color: Color(0xFF121010),
                  //           fontWeight: FontWeight.w700,
                  //           fontSize: 24,
                  //         ),
                  //       ),
                  //       SizedBox(height: 24),
                  //       Text(
                  //         exam.subtitle,
                  //         style: TextStyle(
                  //           height: 1.4,
                  //           color: Color(0xFF121010),
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //       Spacer(),
                  //       TextButton(
                  //         child: Text(
                  //           'Начать',
                  //           style: TextStyle(
                  //             // color: Colors.white,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 14,
                  //           ),
                  //         ),
                  //         style: TextButton.styleFrom(
                  //           primary: Colors.white,
                  //           backgroundColor: Color(0xFF005FCF),
                  //           onSurface: Colors.grey,
                  //           shape: const RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(12),
                  //             ),
                  //           ),
                  //           padding: EdgeInsets.symmetric(vertical: 22),
                  //         ),
                  //         onPressed: () {
                  //           // setState(() {
                  //           //   isLectureShowing = true;
                  //           //   selectedLecture = lecture;
                  //           // });
                  //           // Navigator.pushReplacement<void, void>(
                  //           //   context,
                  //           //   MaterialPageRoute<void>(
                  //           //     builder: (BuildContext context) =>
                  //           //         LoginPage(),
                  //           //   ),
                  //           // );
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  if (widget.userRole == Role.admin)
                    Container(
                      width: 300,
                      height: 290,
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
            GestureDetector(
              onTap: () => {},
              child: Text('Хуяк'),
            ),
          ],
        ),
      ),
    );
  }
}

class LearningSection extends StatefulWidget {
  const LearningSection({
    Key? key,
    required this.userRole,
  }) : super(key: key);

  final Role userRole;

  @override
  State<LearningSection> createState() => _LearningSectionState();
}

class _LearningSectionState extends State<LearningSection> {
  bool isLectureShowing = false;
  late Lecture selectedLecture;

  Widget _buildLecturePage() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 36, horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.chevron_left_rounded,
                    size: 44,
                  ),
                  onTap: () => setState(() {
                    isLectureShowing = false;
                  }),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    selectedLecture.title,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(0xFF121010),
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(40),
              child: Text(
                selectedLecture.fulltext,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      height: 1.4,
                      color: Color(0xFF121010),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLectureShowing
        ? _buildLecturePage()
        : Expanded(
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
                            height: 290,
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
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                                    height: 1.4,
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
                                    setState(() {
                                      isLectureShowing = true;
                                      selectedLecture = lecture;
                                    });
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
                        if (widget.userRole == Role.admin)
                          Container(
                            width: 300,
                            height: 290,
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

enum Pages {
  learning,
  training,
  exam,
  dashboard,
}

class MenuItem {
  final String name;
  final Pages page;

  bool isSelected;
  MenuItem({
    required this.page,
    required this.name,
    this.isSelected = false,
  });
}
