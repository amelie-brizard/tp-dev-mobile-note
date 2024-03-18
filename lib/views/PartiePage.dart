import 'package:flutter/material.dart';
import 'JeuPage.dart';

class PartiePage extends StatefulWidget {
  @override
  _PartiePageState createState() => _PartiePageState();
}

class _PartiePageState extends State<PartiePage> {
  final TextEditingController _controller = TextEditingController();
  String _prenom = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partie'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Entrez votre prénom',
                ),
                onChanged: (value) {
                  setState(() {
                    _prenom = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_prenom.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JeuPage(prenom: _prenom),
                      ),
                    );
                  }
                },
                child: Text('Commencer à jouer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}