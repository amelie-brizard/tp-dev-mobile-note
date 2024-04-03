import 'package:flutter/material.dart';

class ReglesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Règles'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/rules.jpg',
            width: 250,
            height: 180,
          ),
          const SizedBox(height: 5),
          const Padding(
              padding: EdgeInsets.all(23.0),
              child: Text(
                'Pour jouer, vous devez rentrer un nombre dans le but de trouver celui choisi aléatoirement. L’application vous indiquera si celui que vous avez choisi est plus petit ou plus grand que le nombre déterminé aléatoirement au préalable. À la fin de la partie, le nombre de tentatives que vous aurez effetué sera précisé et votre score sera mémorisé et consultable sur la page des scores.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, height: 1.8),
              )),
        ],
      )),
    );
  }
}
