import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isStarted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 1), () {
      setState(() {
        isStarted = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 60, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello Flutter Developers',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: isStarted == true ? 200 : 50,
                  width: isStarted == true ? 200 : 50,
                  child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: isStarted ? 1 : 0,
                      child: Image.asset('assets/logo.png')),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isStarted = !isStarted;
                  });
                },
                child: Text('Click me'))
          ],
        ),
      ),
    );
  }
}
