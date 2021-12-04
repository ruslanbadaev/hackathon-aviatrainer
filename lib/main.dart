import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/pages/trainer/trainer_page.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) {
        runApp(MyApp());
      }),
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
          textTheme: GoogleFonts.ubuntuTextTheme(),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: const {
              TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
            },
          )),
      home: TrainerPage(),
      // home: StartPage(),
    );
  }
}
