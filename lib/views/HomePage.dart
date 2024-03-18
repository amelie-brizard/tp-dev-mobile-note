import 'package:flutter/material.dart';
import 'PartiePage.dart';
import 'ReglePage.dart';
import 'ScorePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PartiePage()),
                );
              },
              child: Text('Démarrer une partie'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoresPage()),
                );
              },
              child: Text('Voir mes scores'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReglesPage()),
                );
              },
              child: Text('Voir les règles'),
            ),
          ],
        ),
      ),
    );
  }
}
