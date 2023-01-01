import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  DrawerDefault({super.key, required this.section, required this.sendActions});

  Function sendActions;
  String section;

  late ButtonsDrawer home = ButtonsDrawer(
      texto: "Home",
      sendActions: () {
        section = home.texto;
        sendActions();
      });
  late ButtonsDrawer nosotros = ButtonsDrawer(
      texto: "Nosotros",
      sendActions: () {
        section = nosotros.texto;
        sendActions();
      });
  late ButtonsDrawer paginasIndicadores = ButtonsDrawer(
      texto: "Paginas/Indicadores",
      sendActions: () {
        section = paginasIndicadores.texto;
        sendActions();
      });
  late ButtonsDrawer servicios = ButtonsDrawer(
      texto: "Servicios",
      sendActions: () {
        section = servicios.texto;
        sendActions();
      });
  late ButtonsDrawer resenas = ButtonsDrawer(
      texto: "Reseñas",
      sendActions: () {
        section = resenas.texto;
        sendActions();
      });
  late ButtonsDrawer contactanos = ButtonsDrawer(
      texto: "Contactanos",
      sendActions: () {
        section = contactanos.texto;
        sendActions();
      });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 4, 26, 58),
      child: Column(children: [
        const SizedBox(height: 50),
        home,
        nosotros,
        paginasIndicadores,
        servicios,
        resenas,
        contactanos
      ]),
    );
  }
}

class ButtonsDrawer extends StatefulWidget {
  ButtonsDrawer({super.key, required this.texto, required this.sendActions});

  Function sendActions;
  String texto;

  @override
  State<ButtonsDrawer> createState() => _ButtonsDrawerState();
}

class _ButtonsDrawerState extends State<ButtonsDrawer> {
  late Color color;
  late Color colorText;
  
  @override
  void initState() {
    color = Colors.white;
    colorText = Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.sendActions();
      },
      onHover: (value) {
        setState(() {
          color = value ? Colors.black : Colors.white;
          colorText = value ? Colors.white : Colors.black;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        color: color,
        child: Text(widget.texto, style: TextStyle(color: colorText)),
      ),
    );
  }
}
