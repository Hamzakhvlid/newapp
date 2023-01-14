import 'package:clickablesvg/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
      },
    );
    return Container(
      color: Colors.white,
      child: Center(
        
        child: Image.asset(MediaQuery.of(context).size.width>800?"assets/way_finding_web.png":"assets/way_finding.png")
      ),
    );
  }
}
