import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack(
        children: [
          Positioned.fill(
            child: BackgroundRiveAnimation(),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundRiveAnimation extends StatefulWidget {
  BackgroundRiveAnimation({super.key});

  @override
  State<BackgroundRiveAnimation> createState() => _BackgroundRiveAnimationState();
}

class _BackgroundRiveAnimationState extends State<BackgroundRiveAnimation> {
  late RiveAnimationController _esamiController;
  @override
  void initState() {
    _esamiController = OneShotAnimation(
      'Star moving 01',
      autoplay: true,
      onStart: () {},
      onStop: () {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/rive/background.riv',
      fit: BoxFit.cover,
      controllers: [_esamiController],
    );
  }
}
