import 'package:flutter/material.dart';
import 'dart:math';

class JeuPage extends StatefulWidget {
  final String prenom;
  JeuPage({required this.prenom});

  @override
  _JeuPageState createState() => _JeuPageState();
}

class _JeuPageState extends State<JeuPage> {
  late int _nombreMystere;
  int _nombreChoisi = 0;
  String _resultat = '';
  int _essais = 0;
  bool _fini = false;
  int _maxValue = 25; // Initial maximum value for the magic number
  int _maxTries = 8; // Maximum number of tries allowed

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initNewGame();
  }

  void _initNewGame() {
    setState(() {
      _nombreMystere = Random().nextInt(_maxValue) + 1;
      _essais = 0;
      _resultat = '';
      _fini = false;
    });
  }

  void _verifierNombre() {
    setState(() {
      _essais++;
      if (_nombreChoisi == _nombreMystere) {
        _resultat = 'Bravo, $_nombreMystere est le bon nombre!';
        _fini = true;
        _maxValue *= 2;
        _maxTries += 1;
      } else if (_essais >= _maxTries) {
        _resultat = 'Désolé, vous avez épuisé vos essais. Le nombre mystère était $_nombreMystere.';
        _fini = true;
      } else if (_nombreChoisi < _nombreMystere) {
        _resultat = 'Le nombre mystère est plus grand';
      } else {
        _resultat = 'Le nombre mystère est plus petit';
      }
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double triesLeftPercentage = (_maxTries - _essais) / _maxTries;

    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu'),
      ),
      body: Center(
        child: _fini
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$_resultat\nNombre d\'essais: $_essais',
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _initNewGame(); // Start a new game
                    },
                    child: Text('Nouveau jeu'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to previous screen
                    },
                    child: Text('Retour'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bonjour ${widget.prenom}! Devinez le nombre mystère (entre 1 et $_maxValue)'),
                  TextField(
                    controller: _controller,
                    onChanged: (value) {
                      setState(() {
                        _nombreChoisi = int.tryParse(value) ?? 0;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Entrez un nombre',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _verifierNombre();
                    },
                    child: Text('Vérifier'),
                  ),
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: triesLeftPercentage,
                    color: Colors.green, // Change color as desired
                    backgroundColor: Colors.grey[300], // Change color as desired
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 20),
                  Text(_resultat),
                ],
              ),
      ),
    );
  }
}
