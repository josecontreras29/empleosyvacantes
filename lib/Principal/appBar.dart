import 'package:empleosyvacantes/constants.dart';
import 'package:empleosyvacantes/responsive.dart';
import 'package:flutter/material.dart';

class PrincipalAppBar extends StatelessWidget {
  PrincipalAppBar(
      {required this.sendActions, required this.selected, super.key});

  Function sendActions;
  String selected;

  late ButtonsAppBar home = ButtonsAppBar(
      texto: "Home",
      sendActions: () {
        selected = home.texto;
        sendActions();
      });
  late ButtonsAppBar nosotros = ButtonsAppBar(
      texto: "Nosotros",
      sendActions: () {
        selected = nosotros.texto;
        sendActions();
      });
  late ButtonsAppBar paginasIndicadores = ButtonsAppBar(
      texto: "Paginas/Indicadores",
      sendActions: () {
        selected = paginasIndicadores.texto;
        sendActions();
      });
  late ButtonsAppBar servicios = ButtonsAppBar(
      texto: "Servicios",
      sendActions: () {
        selected = servicios.texto;
        sendActions();
      });
  late ButtonsAppBar resenas = ButtonsAppBar(
      texto: "Reseñas",
      sendActions: () {
        selected = resenas.texto;
        sendActions();
      });
  late ButtonsAppBar contactanos = ButtonsAppBar(
      texto: "Contactanos",
      sendActions: () {
        selected = contactanos.texto;
        sendActions();
      });

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.black,
      leadingWidth: MediaQuery.of(context).size.width * 0.2,
      leading: Container(
          color: Colors.green,
          child: Image.network(
            empleosyvacanteslogo,
            fit: BoxFit.fill,
          )),
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
                    home,
                    nosotros,
                    paginasIndicadores,
                    servicios,
                    resenas,
                    contactanos
                  ],
                ),
              ),
            ]
          : null,
    );
  }
}

class ButtonsAppBar extends StatelessWidget {
  ButtonsAppBar({super.key, required this.texto, required this.sendActions});

  String texto;
  Function sendActions;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            sendActions();
          },
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              texto,
              style: TextStylesProject.joffert,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
