import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as found;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/category.dart';
import '../../widgets/quiz_options.dart';
import '../profile/profile_page.dart';

class HomePage extends StatelessWidget {
  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('NORMANDY Avia Trainer',
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        actions: [
          Center(
            child: Text(
              "Очки: 256",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 24,
          ),

          IconButton(
            onPressed: () => {
              found.kIsWeb
                  ? _launchURL(
                      'https://sbcode.net/extra_html/physics-heli.html')
                  : Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProfilePage(),
                      ),
                    ),
            },
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.blueAccent,
            ),
          ),
          IconButton(
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProfilePage(),
                ),
              ),
            },
            icon: Icon(
              CupertinoIcons.waveform_path_badge_plus,
              color: Colors.blueAccent,
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.all(8),
          //   child: FloatingActionButton.extended(
          //     backgroundColor: Colors.blueAccent,
          //     onPressed: () => {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (_) => ProfilePage(),
          //         ),
          //       ),
          //     },
          //     label: Row(
          //       children: [
          //         Icon(CupertinoIcons.profile_circled),
          //         Text('Профиль'),
          //       ],
          //     ),
          //   ),
          // ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Выберите урок:",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 1000
                          ? 7
                          : MediaQuery.of(context).size.width > 600
                              ? 5
                              : 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  delegate: SliverChildBuilderDelegate(
                    _buildCategoryItem,
                    childCount: categories.length,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return MaterialButton(
      elevation: 0.0,
      highlightElevation: 1.0,
      onPressed: () => _categoryPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      textColor: Colors.grey[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(color: Colors.black.withOpacity(.7), fontSize: 16),
          ),
        ],
      ),
    );
  }

  _categoryPressed(BuildContext context, Category category) {
    showDialog(
      context: context,
      builder: (sheetContext) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        // contentPadding: EdgeInsets.only(top: 10.0),
        content: QuizOptionsDialog(
          category: category,
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
