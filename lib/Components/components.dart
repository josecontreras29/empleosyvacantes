import 'package:flutter/material.dart';

class WebsiteCards extends StatefulWidget {
  WebsiteCards({super.key, required this.photo});

  String photo;
  @override
  State<WebsiteCards> createState() => _WebsiteCardsState();
}

class _WebsiteCardsState extends State<WebsiteCards> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
        color: Colors.transparent,
        duration: const Duration(milliseconds: 300),
        width: hovered
            ? MediaQuery.of(context).size.width / 2.5
            : MediaQuery.of(context).size.width / 2.7,
        child: Image.asset(
          widget.photo,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
