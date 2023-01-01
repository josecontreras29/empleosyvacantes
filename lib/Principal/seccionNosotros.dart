import 'package:flutter/material.dart';

class InfoCuentaEmpleo extends StatelessWidget {
  InfoCuentaEmpleo({super.key, required this.titleAccount, required this.photo, required this.infoAccount});
  String titleAccount;
  Map<dynamic,String> infoAccount;
  String photo;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleAccount,
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(40),
              child: Image.asset(
                photo,
                fit: BoxFit.fitWidth,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.yellow[700],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.groups,
                              size: 22,
                            ),
                            Text("MAS DE 20.000 SEGUIDORES"),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.badge,
                              size: 22,
                            ),
                            Text(
                              "ENFOCADA EN COMPARTIR \n EMPLEOS DE BOGOTA/MEDELLIN",
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.timer_sharp,
                              size: 22,
                            ),
                            Text(
                              "MAS DE 6000 PERSONAS POR HISTORIA",
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
