import 'dart:html';

import 'package:empleosyvacantes/Components/components.dart';
import 'package:empleosyvacantes/constants.dart';
import 'package:empleosyvacantes/responsive.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animation2;
  late Animation<double> animation3;

  Animation<double> animationFade(double startValue) {
    animation = Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(parent: controller, curve:   Interval(startValue,1.0,curve: Curves.linear)));
   return animation;
   }

  @override
  void initState() {
   controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    // Responsive responsive = Responsive(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
         color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                    color: Colors.black,
                    height: screenSize.height,
                    width: screenSize.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FadeTransition(
                          opacity: animationFade(0.0),
                          child: Container(
                          color: Colors.transparent,
                          child: Text(
                            "JOFFERT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.width * 0.05,
                                fontWeight: FontWeight.w900),
                          ),
                          ),
                        ),
                        FadeTransition(
                          opacity: animationFade(0.6),
                          child: Container(
                          color: Colors.transparent,
                          child: CircularProgressIndicator()
                          ),
                        ),
                        FadeTransition(
                          opacity: animationFade(0.3),
                          child: Container(
                          color: Colors.transparent,
                          child: Text(
                            "Tu mejor opcion para publicar ofertas",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.width * 0.02,
                                fontWeight: FontWeight.w900),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
              Row(
                  children: [
                    WebsiteCards(photo: empleosyvacantes),
                    WebsiteCards(photo: empleosbaq)
                  ],
                ),
         
            ],
          ),
        ),
      ),
    );
  }
}
