import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:video_player/video_player.dart';

class SimulationPage extends StatefulWidget {
  @override
  _SimulationPageState createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  VideoPlayerController? _controller;
  bool _showCard = false;
  bool _isFinished = false;
  String _cardTitle = '';
  String _cardBody = '';
  String _currentButtonName = '';
  void initState() {
    _controller = VideoPlayerController.asset('assets/videos/lesson_1.avi')
      ..initialize().then(
        (_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        },
      );
    // _controller = VideoPlayerController.network('https://vk.com/video-195650892_456239017')
    //   ..initialize().then(
    //     (_) {
    //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //       setState(() {});
    //     },
    //   );
    _timer(
      title: 'Действие 1:',
      body: 'Для поднятия аппарата вверх - нажмите обозначенную кнопку "Вверх"',
      buttonName: 'up',
      seconds: 0,
      milliseconds: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.transparent,
      //   title: Text('Check Answers', style: TextStyle(color: Colors.black)),
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          _controller!.value.isInitialized ? VideoPlayer(_controller!) : Container(),
          Positioned(
            left: 20,
            bottom: 10,
            child: FloatingActionButton(
              backgroundColor:
                  _currentButtonName == 'down' ? Colors.red.withOpacity(.3) : Colors.blueGrey.withOpacity(.3),
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white10,
                size: 36,
              ),
              onPressed: () => {
                if (_currentButtonName == 'down')
                  {
                    _hideCardAlert(),
                    _timer(
                      title: 'Действие 5:',
                      body: 'Отключите аппарат - нажмите обозначенную кнопку "Отключение двигателей"',
                      buttonName: 'off',
                      seconds: 2,
                      milliseconds: 900,
                    ),
                  },
              },
            ),
          ),
          Positioned(
            left: 20,
            bottom: 80,
            child: FloatingActionButton(
              backgroundColor:
                  _currentButtonName == 'up' ? Colors.red.withOpacity(.3) : Colors.blueGrey.withOpacity(.3),
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white10,
                size: 36,
              ),
              onPressed: () => {
                if (_currentButtonName == 'up')
                  {
                    _hideCardAlert(),
                    _timer(
                      title: 'Действие 2:',
                      body: 'Для прямого движения аппарата - нажмите обозначенную кнопку "Вперед"',
                      buttonName: 'forward',
                      seconds: 0,
                      milliseconds: 200,
                    ),
                  },
              },
            ),
          ),
          Positioned(
            right: 90,
            bottom: 10,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey.withOpacity(.3),
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white10,
                size: 36,
              ),
              onPressed: () => {},
            ),
          ),
          Positioned(
            right: 90,
            bottom: 100,
            child: FloatingActionButton(
              backgroundColor:
                  _currentButtonName == 'forward' ? Colors.red.withOpacity(.3) : Colors.blueGrey.withOpacity(.3),
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white10,
                size: 36,
              ),
              onPressed: () => {
                if (_currentButtonName == 'forward')
                  {
                    _hideCardAlert(),
                    _timer(
                      title: 'Действие 3:',
                      body:
                          'Скорректируйте движение аппарата с поправкой на ветер - нажмите обозначенную кнопку "Вправо"',
                      buttonName: 'right',
                      seconds: 0,
                      milliseconds: 500,
                    ),
                  },
              },
            ),
          ),
          Positioned(
            right: 45,
            bottom: 55,
            child: FloatingActionButton(
              backgroundColor:
                  _currentButtonName == 'right' ? Colors.red.withOpacity(.3) : Colors.blueGrey.withOpacity(.3),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white10,
                size: 36,
              ),
              onPressed: () => {
                if (_currentButtonName == 'right')
                  {
                    _hideCardAlert(),
                    _timer(
                      title: 'Действие 4:',
                      body: 'Начните посадку аппарата - нажмите обозначенную кнопку "Вниз"',
                      buttonName: 'down',
                      seconds: 0,
                      milliseconds: 900,
                    ),
                  },
              },
            ),
          ),
          Positioned(
            right: 135,
            bottom: 55,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey.withOpacity(.3),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white10,
                size: 36,
              ),
              onPressed: () => {},
            ),
          ),
          // Positioned(
          //   left: 260,
          //   bottom: 10,
          //   child: FloatingActionButton(
          //     onPressed: () => {},
          //   ),
          // ),
          // Positioned(
          //   left: 340,
          //   bottom: 10,
          //   child: FloatingActionButton(
          //     onPressed: () => {},
          //   ),
          // ),
          // Positioned(
          //   left: 420,
          //   bottom: 10,
          //   child: FloatingActionButton(
          //     onPressed: () => {},
          //   ),
          // ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.blueGrey.withOpacity(.3),
                    child: Icon(
                      Icons.camera,
                      color: Colors.white10,
                      size: 36,
                    ),
                    onPressed: () => {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    backgroundColor:
                        _currentButtonName == 'off' ? Colors.red.withOpacity(.3) : Colors.blueGrey.withOpacity(.3),
                    child: Icon(
                      Icons.offline_bolt,
                      color: Colors.white10,
                      size: 36,
                    ),
                    onPressed: () => {
                      if (_currentButtonName == 'off')
                        {
                          _hideCardAlert(),
                          _showFinishAlert(
                            title: 'Отлично!',
                            body: 'Вы завершили симуляцию',
                            buttonName: '',
                          ),
                        },
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blueGrey.withOpacity(.3),
                    child: Icon(
                      Icons.cable,
                      color: Colors.white10,
                      size: 36,
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
          ),
          if (_showCard)
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  width: 360,
                  height: _isFinished ? 240 : 180,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          _cardTitle,
                          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w700, fontSize: 24.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          _cardBody,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        if (_isFinished)
                          RaisedButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                            child: Text("Выйти из урока", style: TextStyle(color: Colors.white)),
                            onPressed: () => {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (_) => HomePage(),
                              //   ),
                              // ),
                              Navigator.pop(context),
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(
      //       () {
      //         // _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();

      //         _timer(
      //           title: 'Действие 1:',
      //           body: 'Для поднятия аппарата вверх - нажмите обозначенную кнопку "Вверх"',
      //           buttonName: 'up',
      //           seconds: 0,
      //           milliseconds: 0,
      //         );
      //       },
      //     );
      //   },
      //   child: Icon(
      //     _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }

  void _timer({
    required String title,
    required String body,
    required String buttonName,
    required int milliseconds,
    required int seconds,
  }) async {
    _controller!.play();
    await Future.delayed(
      Duration(seconds: seconds, milliseconds: milliseconds),
      () {
        _controller!.pause();
        _showCardAlert(
          title: title,
          body: body,
          buttonName: buttonName,
        );
      },
    );
  }

  void _showCardAlert({required String title, required String body, required String buttonName}) {
    setState(() {
      _showCard = true;
      _cardTitle = title;
      _cardBody = body;
      _currentButtonName = buttonName;
    });
  }

  void _showFinishAlert({required String title, required String body, required String buttonName}) {
    setState(() {
      _showCard = true;
      _cardTitle = title;
      _cardBody = body;
      _currentButtonName = buttonName;
      _isFinished = true;
    });
  }

  void _hideCardAlert() {
    setState(() {
      _showCard = false;
      _cardTitle = '';
      _cardBody = '';
      _currentButtonName = '';
    });
  }
}
