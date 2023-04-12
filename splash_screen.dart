import 'dart:async';
import 'package:splash_route/splash_route.dart';

import 'package:animation_demo/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool start = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Timer(Duration(milliseconds: 1000), () {
        setState(() {
          start = true;
        });
      });

      Timer(Duration(milliseconds: 3000), () {
        setState(() {
          // gotoPage();
          splashRoute();
        });
      });
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: start ? 1.0 : 0.0,
                child: const Text(
                  'Hello\nFlutter Developers',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Center(
                  child: AnimatedContainer(
                    height: start ? 150 : 50,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: start ? 1.0 : 0.0,
                      child: Image.asset(
                        'assets/logo2.png',
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   start = !start;
                    // });
                  },
                  child: Text('Click me'))
            ],
          ),
        ),
      ),
    );
  }

  void gotoPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => MyHomePage(),
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, a, __, c) =>
            FadeTransition(opacity: a, child: MyHomePage()),
      ),
    );
  }

  void splashRoute() {
    Navigator.of(context).push(
      SplashRoute(
        targetPage: MyHomePage(),
        splashColor: Colors.green,
        startFractionalOffset: FractionalOffset.center,
        transitionDuration: Duration(seconds: 2),
      ),
    );
  }
}
