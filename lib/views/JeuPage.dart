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

  @override
  void initState() {
    super.initState();
    _nombreMystere = Random().nextInt(100) + 1;
  }

  void _verifierNombre() {
    setState(() {
      _essais++;
      if (_nombreChoisi == _nombreMystere) {
        _resultat = 'Bravo, $_nombreMystere est le bon nombre!';
        _fini = true;
      } else if (_nombreChoisi < _nombreMystere) {
        _resultat = 'Le nombre mystère est plus grand';
      } else {
        _resultat = 'Le nombre mystère est plus petit';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      Navigator.pop(context);
                    },
                    child: Text('Retour'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bonjour ${widget.prenom}! Devinez le nombre mystère (entre 1 et 100)'),
                  TextField(
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
                  Text(_resultat),
                ],
              ),
      ),
    );
  }
}