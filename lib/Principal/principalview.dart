import 'package:empleosyvacantes/Principal/appBar.dart';
import 'package:empleosyvacantes/Principal/drawer.dart';
import 'package:empleosyvacantes/Principal/seccionNosotros.dart';
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
  late PrincipalAppBar appbar;
  late DrawerDefault drawer;
  late InfoCuentaEmpleo empleosyvacantesSection;
  final ScrollController scrollController = ScrollController();

  GlobalKey home = GlobalKey();
  GlobalKey nosotros = GlobalKey();
  GlobalKey paginasIndicadores = GlobalKey();

  Animation<double> animationFade(double startValue) {
    animation = Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(startValue, 1.0, curve: Curves.linear)));
    return animation;
  }

  void scrollMovement(String selected) {
    switch (selected) {
      case "Home":
        Scrollable.ensureVisible(home.currentContext!,
            duration: const Duration(seconds: 2), curve: Curves.ease);
        break;
      case "Nosotros":
        Scrollable.ensureVisible(nosotros.currentContext!,
            duration: const Duration(seconds: 2), curve: Curves.ease);
        break;
      case "Paginas/Indicadores":
        Scrollable.ensureVisible(paginasIndicadores.currentContext!,
            duration: const Duration(seconds: 2), curve: Curves.ease);
        break;
      case "Servicios":
        break;
      default:
    }
  }

  @override
  void initState() {
    empleosyvacantesSection = InfoCuentaEmpleo(
      infoAccount: const {
        1: "MAS DE 20.000 SEGUIDORES",
        2: "ENFOCADA EN COMPARTIR \n EMPLEOS DE BOGOTA/MEDELLIN",
        3: "MAS DE 6000 PERSONAS POR HISTORIA"
      },
      photo: empleosyvacantes,
      titleAccount: "@empleosyvacantes",
    );
    appbar = PrincipalAppBar(
      selected: "",
      sendActions: () {
        scrollMovement(appbar.selected);
      },
    );
    drawer = DrawerDefault(
      section: "",
      sendActions: () {
        scrollMovement(drawer.section);
      },
    );
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    super.initState();
    controller.forward();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: responsive.isMobile ? drawer : null,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
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
                color: Colors.grey,
                height: screenSize.height,
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
                    Flexible(child: SizedBox()),
                    empleosyvacantesSection,
                    Flexible(child: SizedBox()),
                    Flexible(
                      flex: 2,
                      child: Container(
                        key: nosotros,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(40),
                              child: Image.asset(
                                empleosbaq,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    color: Colors.blue,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: 22,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 10),
                                            child: const Text("@EMPLEOSBAQ")),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.blue,
                                    child: Row(
                                      children: [
                                        const Icon(
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
                                  ),
                                  Container(
                                    color: Colors.blue,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.badge,
                                          size: 22,
                                        ),
                                        Text(
                                            "ENFOCADA EN COMPARTIR \n EMPLEOS DEL ATLANTICO"),
                                      ],
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ),
                    Flexible(child: SizedBox()),
                  ],
                ),
              ),
              Container(
                key: paginasIndicadores,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.only(bottom: 200, left: 200, right: 200),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: const Text(
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
