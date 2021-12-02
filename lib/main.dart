import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/pages/home_page/home.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) {
        runApp(new MyApp());
      }),
      runApp(MyApp()),
    };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueGrey,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
