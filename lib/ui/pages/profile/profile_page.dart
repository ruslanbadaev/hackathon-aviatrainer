import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.transparent,
      //   title: Text('Илон Маск', style: TextStyle(color: Colors.black)),
      //   elevation: 0,
      // ),
      body: WebviewScaffold(
        url: "https://sbcode.net/extra_html/physics-heli.html",
        // appBar: new AppBar(
        //   title: new Text("Widget webview"),
        // ),
      ),
      // body: WebView(
      //   initialUrl: 'https://sbcode.net/extra_html/physics-heli.html',
      // ),
      // body: Center(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       _avatar(context),
      //       SizedBox(
      //         height: 12,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             "Очки: ",
      //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //           Text(
      //             " 256",
      //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             "Уровень: ",
      //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //           Text(
      //             " 2",
      //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             "Стаж в симуляторе: ",
      //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //           Text(
      //             " 4 часа 21 минута",
      //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             "Эффективность: ",
      //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //           Text(
      //             " 32%",
      //             style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w500, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             "Разрешение на полёт: ",
      //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //           Text(
      //             " нет",
      //             style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 18.0),
      //             textAlign: TextAlign.center,
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

Widget _avatar(context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: SizedBox(
      height: 120,
      width: 120,
      child: Image.network(
        'https://cdnn21.img.ria.ru/images/07e5/03/04/1599866764_0:190:3084:1924_1920x0_80_0_0_18fbeacb1a29f798b3a6a8ced6383615.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );
}
