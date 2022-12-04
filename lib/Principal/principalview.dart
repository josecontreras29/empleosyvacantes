import 'package:empleosyvacantes/Components/components.dart';
import 'package:empleosyvacantes/constants.dart';
import 'package:empleosyvacantes/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

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
        height: screenSize.height,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                height: screenSize.height,
                width: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "JOFFERT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.w900),
                    ),
                    Container(
                        width: screenSize.width * 0.05,
                        height: screenSize.width * 0.05,
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                          maxHeight: 200,
                        ),
                        child: const CircularProgressIndicator(
                          strokeWidth: 8,
                        ))
                  ],
                ),
              ),
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromLTRB(
                      -MediaQuery.of(context).size.width / 2.5,
                      0,
                      MediaQuery.of(context).size.width / 1.5,
                      0),
                  end: RelativeRect.fromLTRB(
                      0, 0, MediaQuery.of(context).size.width / 2.5, 0),
                ).animate(
                  CurvedAnimation(parent: controller, curve: Curves.bounceOut),
                ),
                child: FadeTransition(
                  opacity: animation,
                  child: WebsiteCards(photo: empleosbaq),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: WebsiteCards(photo: empleosyvacantes))
            ],
          ),
        ),
      ),
    );
  }
}
