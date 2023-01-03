import 'package:flutter/material.dart';

class HomeSeccion extends StatefulWidget {
  HomeSeccion({super.key});

  @override
  State<HomeSeccion> createState() => _HomeSeccionState();
}

class _HomeSeccionState extends State<HomeSeccion>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  Animation<double> animationFade(double startValue) {
    animation = Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(startValue, 1.0, curve: Curves.linear)));
    return animation;
  }

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
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
                child: const Icon(
                  Icons.time_to_leave,
                  color: Colors.red,
                  size: 80,
                )),
          ),
          FadeTransition(
            opacity: animationFade(0.3),
            child: Container(
              color: Colors.transparent,
              child: Text(
                "Tu mejor opcion para descubrir nuevas oportunidas \n y contratar el mejor talento",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.02,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
