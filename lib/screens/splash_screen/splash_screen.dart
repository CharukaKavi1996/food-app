import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/screens/splash_screen/getting_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const GettingStarted()));
    });
  }

  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/food.png'),
            const SizedBox(height: 8.0,),
            const Text("No waiting for food",
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xff838383),
            ),),
          ],
        ),
      ),
    );
  }
}