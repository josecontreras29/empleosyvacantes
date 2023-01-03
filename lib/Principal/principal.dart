import 'package:empleosyvacantes/Components/appBar.dart';
import 'package:empleosyvacantes/Components/drawer.dart';
import 'package:empleosyvacantes/Principal/seccionHome.dart';
import 'package:empleosyvacantes/Principal/seccionNosotros.dart';
import 'package:empleosyvacantes/constants.dart';
import 'package:empleosyvacantes/responsive.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  late PrincipalAppBar appbar;
  late DrawerDefault drawer;
  late InfoCuentasNosotros empleosyvacantesSection;
  late InfoCuentasNosotros empleosbaqSection;
  final ScrollController scrollController = ScrollController();

  GlobalKey home = GlobalKey();
  GlobalKey nosotros = GlobalKey();
  GlobalKey paginasIndicadores = GlobalKey();

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
    empleosyvacantesSection = InfoCuentasNosotros(
      infoAccount: {
        Icons.person: "MAS DE 20.000 SEGUIDORES",
        Icons.badge: "ENFOCADA EN COMPARTIR EMPLEOS DE\nBOGOTA/MEDELLIN",
        Icons.group: "MAS DE 6000 PERSONAS POR HISTORIA"
      },
      photo: empleosyvacantes,
      titleAccount: "@empleosyvacantes",
    );
    empleosbaqSection = InfoCuentasNosotros(
      infoAccount: {
        Icons.person: "MAS DE 20.000 SEGUIDORES",
        Icons.badge: "ENFOCADA EN COMPARTIR EMPLEOS DEL\nATLANTICO",
        Icons.group: "MAS DE 8000 PERSONAS POR HISTORIA"
      },
      photo: empleosbaq,
      titleAccount: "@empleosbaq",
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
    super.initState();
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
              Container(key: home, child: HomeSeccion()),
              Container(
                key: nosotros,
                color: Colors.grey,
                constraints: const BoxConstraints(maxHeight: 1000),
                padding: const EdgeInsets.symmetric(vertical: 40),
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
                    const Spacer(),
                    empleosyvacantesSection,
                    const Spacer(),
                    empleosbaqSection,
                    const Spacer()
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
