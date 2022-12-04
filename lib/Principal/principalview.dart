import 'package:empleosyvacantes/Components/components.dart';
import 'package:empleosyvacantes/constants.dart';
import 'package:empleosyvacantes/responsive.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hovered2 = false;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
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
              Positioned(
                  top: 0, left: 0, child: WebsiteCards(photo: empleosbaq)),
              Positioned(
                  top: 0,
                  right: 0               ,
                  child: WebsiteCards(photo: empleosyvacantes))
            ],
          ),
        ),
      ),
    );
  }
}
