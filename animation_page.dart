import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: double.maxFinite,
          margin: EdgeInsets.all(isClicked? 100 : 50),

          decoration: BoxDecoration(
            color: isClicked ? Colors.tealAccent : Colors.deepPurple,
            borderRadius: BorderRadius.circular(isClicked ? 50 : 0),
          ),

          // height: 400,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: isClicked == true ? 120 : 70,
                height: isClicked ? 120 : 70,
                decoration: BoxDecoration(
                  color: isClicked ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(isClicked ? 50 : 0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  // child: Text(isClicked ? 'Circle' : 'Square'),
                  child: isClicked? Text('Circle') : Text('Squre'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                  },
                  child: Text('Click here'))
            ],
          ),
        ),
      ),
    );
  }
}
