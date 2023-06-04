import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:shopping_cart/product_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const productlist())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 400,
                  width: 300,
                  child: const Center(
                      child: Image(
                    image: AssetImage('images/tb.jpg'),
                  )),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    // angle: _controller.value * 0.5 * math.pi,
                    angle: math.sin(_controller.value * 2.0 * math.pi) * 0.2,
                    child: child,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Column(children: [
             Align(
                alignment: Alignment.center,
                child: Text(
                  " Welcome to Vegatable's shop  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Courgette',
                      fontSize: 25,
                      color: Colors.green),
                )),

                Align(
                alignment: Alignment.center,
                child: Text(
                  " Clean - Fresh - Eat ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.green),
                )),
            ],),
            
          
          
          ],
        ),
      ),
    );
  }
}
