import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hovered = false; 
  bool hovered2 = false;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red, 
              child: const Text(
                "PROXIMAMENTE",
                style: TextStyle(fontSize: 60),
              ),
            ),
            Container(
              color: Colors.red,
              margin: const EdgeInsets.only(
                top: 200,
              ),
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    child: MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          hovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          hovered = false;
                        });
                      },
                      child: AnimatedContainer(
                        color: Colors.red,
                        duration: const Duration(milliseconds: 300),
                        width: hovered
                            ? MediaQuery.of(context).size.width / 2.5
                            : MediaQuery.of(context).size.width / 2.7,
                        child: Image.asset(
                          "photos/Empleosbaqlogo.jpeg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        hovered2 = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        hovered2 = false;
                      });
                    },
                    child: AnimatedContainer(
                      color: Colors.red,
                      duration: const Duration(milliseconds: 300),
                      width: hovered2
                          ? MediaQuery.of(context).size.width / 2.5
                          : MediaQuery.of(context).size.width / 2.7,
                      child: Image.asset(
                        "photos/Empleosyvacanteslogo.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
