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
    animation = Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(startValue, 1.0, curve: Curves.linear)));
    return animation;
  }

  late PrincipalAppBar appbar;
  late Container empleosyvacantesSection;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    empleosyvacantesSection = Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(40),
            child: WebsiteCards(photo: empleosyvacantes),
          ),
          Container(
            color: Colors.yellow[700],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 22,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: const Text("@EMPLEOSYVACANTES")),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.groups,
                        size: 22,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: const Text("MAS DE 20.000 SEGUIDORES")),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.badge,
                        size: 22,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: const Text(
                            "ENFOCADA EN COMPARTIR \n EMPLEOS DE BOGOTA/MEDELLIN",
                            textAlign: TextAlign.justify,
                          )),
                    ],
                  ),
                ]),
          )
        ],
      ),
    );
    appbar = PrincipalAppBar(
      selected: "",
      receiveActions: () {},
      sendActions: () {
        switch (appbar.selected) {
          case "home":
            Scrollable.ensureVisible(home.currentContext!,
                duration: const Duration(seconds: 2), curve: Curves.ease);
            break;
          case "nosotros":
            Scrollable.ensureVisible(nosotros.currentContext!,
                duration: const Duration(seconds: 2), curve: Curves.ease);
            break;
          case "paginas_indicadores":
            Scrollable.ensureVisible(paginas_indicadores.currentContext!,
                duration: const Duration(seconds: 2), curve: Curves.ease);
            break;
          case "servicios":
            break;
          default:
        }
      },
    );
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  GlobalKey home = GlobalKey();
  GlobalKey nosotros = GlobalKey();
  GlobalKey paginas_indicadores = GlobalKey();

  @override
  Widget build(BuildContext context) {
    controller.forward();
    Responsive responsive = Responsive(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: responsive.isMobile
          ? Drawer(
              child: Column(children: [
                Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("INICIO")),
                Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("INICIO")),
                Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("INICIO")),
              ]),
            )
          : null,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(color: Colors.transparent, child: appbar),
      ),
      body: Container(
        width: screenSize.width,
        color: Colors.black,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Container(
                key: home,
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
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 200),
                child: Flex(
                  mainAxisAlignment: responsive.isMobile
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: responsive.isMobile
                      ? CrossAxisAlignment.stretch
                      : CrossAxisAlignment.center,
                  direction:
                      responsive.isTablet ? Axis.vertical : Axis.horizontal,
                  children: [
                    empleosyvacantesSection,
                    Container(
                      key: nosotros,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(40),
                            child: WebsiteCards(photo: empleosbaq),
                          ),
                          Container(
                            color: Colors.blue,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 22,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 10),
                                          child: const Text("@EMPLEOSBAQ")),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.groups,
                                        size: 22,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 10),
                                          child: const Text(
                                              "MAS DE 20.000 SEGUIDORES")),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.badge,
                                        size: 22,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: const Text(
                                              "ENFOCADA EN COMPARTIR \n EMPLEOS DEL ATLANTICO")),
                                    ],
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                key: paginas_indicadores,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 200, left: 200, right: 200),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Text(
                  "PAGINAS/INDICADORES",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
