import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/login/Login.dart';

class IntroloadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay for 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginsignupWidget()),
      );
    });

    return Container(
      width: 393,
      height: 852,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(69, 178, 143, 1),
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.white,
                child: SvgPicture.asset(
                  'assets/images/kapitbahaylogo.svg',
                  semanticsLabel: 'kapitbahaylogo',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 230,
            left: 0,
            right: 0,
            child: const Text(
              'KapitBuddy',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
