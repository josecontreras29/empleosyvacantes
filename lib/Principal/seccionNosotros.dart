import 'package:flutter/material.dart';

class InfoCuentasNosotros extends StatelessWidget {
  InfoCuentasNosotros(
      {super.key,
      required this.titleAccount,
      required this.photo,
      required this.infoAccount});
  String titleAccount;
  Map<dynamic, String> infoAccount;
  String photo;

  List<Widget> createItems() {
    List<Widget> listaWidgets = [];
    for (var value in infoAccount.keys) {
      listaWidgets.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                value,
                size: 22,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    infoAccount[value]!,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return listaWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
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
                    children: createItems()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
