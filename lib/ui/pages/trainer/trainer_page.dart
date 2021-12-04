// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:webviewx/webviewx.dart';

// class TrainerPage extends StatefulWidget {
//   @override
//   _TrainerPageState createState() => _TrainerPageState();
// }

// late WebViewXController? webviewController;
// double _screenWidth = 0;
// double _screenHeight = 0;
// bool foolScreen = true;

// class _TrainerPageState extends State<TrainerPage> {
//   void initState() {
//     super.initState();
//     // webviewController.
//   }

//   @override
//   Widget build(BuildContext context) {
//     _screenWidth = MediaQuery.of(context).size.width;
//     _screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: foolScreen ? 0 : 50, vertical: foolScreen ? 0 : 50),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (!foolScreen)
//                 Text(
//                   'Тренажёр',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 36,
//                   ),
//                 ),
//               if (!foolScreen)
//                 SizedBox(
//                   height: 40,
//                 ),
//               InkWell(
//                 onTap: () => {
//                   setState(() {
//                     print('object---');
//                     foolScreen = !foolScreen;
//                   })
//                 },
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     width: double.infinity,
//                     height: _screenHeight,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFF242629),
//                     ),
//                     child: InkWell(
//                       onTap: () => {
//                         setState(() {
//                           print('object---');
//                           foolScreen = !foolScreen;
//                         })
//                       },
//                       child: WebViewX(
//                         width: _screenWidth,
//                         height: foolScreen ? _screenHeight : _screenHeight / 2,
//                         initialContent: 'http://134.0.117.33:3000',
//                         initialSourceType: SourceType.url,
//                         onWebViewCreated: (controller) => webviewController = controller,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: _screenWidth / 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Freeplay',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 24,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         Text(
//                           'Полет при идеальных погодных условиях. В нем вы можете ознакомиться с управлением беспелотного летательного аппарата. Для управления при помощи клавиатуры используйте: ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'W - для движения вперед\nA - для движения влево\nS - для движения назад\nD - для движения вправо',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Text(
//                               'Shift - для набора высоты\nCtrl - для приземления',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 260,
//                     height: 292,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF7F8FA),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(30),
//                       child: Column(
//                         children: [
//                           // Container(
//                           //   color: Colors.black,
//                           //   height: 128,
//                           //   width: 128,
//                           // ),
//                           QrImage(
//                             data: "ivan",
//                             version: QrVersions.auto,
//                             size: 128.0,
//                           ),
//                           SizedBox(
//                             height: 16,
//                           ),
//                           Text(
//                             'Отсканировав QR-код вы можете использовать ваш смартфон в качестве контроллера',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () => setState(() {
//                 print('object---');
//                 foolScreen = !foolScreen;
//               })),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:webviewx/webviewx.dart';

class TrainerPage extends StatefulWidget {
  @override
  _TrainerPageState createState() => _TrainerPageState();
}

late WebViewXController? webviewController;
double _screenWidth = 0;
double _screenHeight = 0;
bool foolScreen = true;

class _TrainerPageState extends State<TrainerPage> {
  void initState() {
    super.initState();
    // webviewController.
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: foolScreen ? 0 : 50, vertical: foolScreen ? 0 : 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!foolScreen)
              Text(
                'Тренажёр',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            if (!foolScreen)
              SizedBox(
                height: 40,
              ),
            InkWell(
              onTap: () => {
                setState(() {
                  print('object---');
                  foolScreen = !foolScreen;
                })
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  height: _screenHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF242629),
                  ),
                  child: InkWell(
                    onTap: () => {
                      setState(() {
                        print('object---');
                        foolScreen = !foolScreen;
                      })
                    },
                    child: WebViewX(
                      width: _screenWidth,
                      height: foolScreen ? _screenHeight : _screenHeight / 2,
                      initialContent: 'http://134.0.117.33:3000',
                      initialSourceType: SourceType.url,
                      onWebViewCreated: (controller) =>
                          webviewController = controller,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: _screenWidth / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Freeplay',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Полет при идеальных погодных условиях. В нем вы можете ознакомиться с управлением беспелотного летательного аппарата. Для управления при помощи клавиатуры используйте: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'W - для движения вперед\nA - для движения влево\nS - для движения назад\nD - для движения вправо',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Shift - для набора высоты\nCtrl - для приземления',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 260,
                  height: 292,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF7F8FA),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        // Container(
                        //   color: Colors.black,
                        //   height: 128,
                        //   width: 128,
                        // ),
                        QrImage(
                          data: "ivan",
                          version: QrVersions.auto,
                          size: 128.0,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Отсканировав QR-код вы можете использовать ваш смартфон в качестве контроллера',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
