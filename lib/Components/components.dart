import 'package:empleosyvacantes/constants.dart';
import 'package:empleosyvacantes/responsive.dart';
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
            ? MediaQuery.of(context).size.width / 4.6
            : MediaQuery.of(context).size.width / 4.7,
        child: Image.asset(
          widget.photo,
        ),
      ),
    );
  }
}

class PrincipalAppBar extends StatefulWidget {
  PrincipalAppBar(
      {required this.sendActions,
      required this.receiveActions,
      required this.selected,
      super.key});

  Function sendActions;
  Function receiveActions;
  String selected;
  @override
  State<PrincipalAppBar> createState() => _PrincipalAppBarState();
}

class _PrincipalAppBarState extends State<PrincipalAppBar> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return AppBar(
        backgroundColor: Colors.black,
        actions: !responsive.isMobile
            ? [
                const Flexible(child: SizedBox()),
                Flexible(
                  flex: responsive.isTablet
                      ? 3
                      : responsive.isMobile
                          ? 4
                          : 1,
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: InkWell(
                            hoverColor: Colors.transparent,
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            onTap: () {
                              widget.selected = "home";
                              widget.sendActions();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                "INICIO",
                                style: TextStylesProject.joffert,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: InkWell(
                              hoverColor: Colors.transparent,
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                widget.selected = "nosotros";
                                widget.sendActions();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  "NOSOTROS",
                                  style: TextStylesProject.joffert,
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: InkWell(
                              hoverColor: Colors.transparent,
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                widget.selected = "paginas_indicadores";
                                widget.sendActions();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  "PAGINAS/INDICADORES",
                                  style: TextStylesProject.joffert,
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: InkWell(
                              hoverColor: Colors.transparent,
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                widget.selected = "servicios";
                                widget.sendActions();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  "SERVICIOS",
                                  style: TextStylesProject.joffert,
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Text(
                              "RESEÑAS",
                              style: TextStylesProject.joffert,
                            )),
                      ),
                      Flexible(
                        child: Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Text(
                              "CONTACTANOS",
                              style: TextStylesProject.joffert,
                            )),
                      ),
                    ],
                  ),
                ),
              ]
            : null);
  }
}
