import 'package:flutter/material.dart';
import 'DatabaseHelper.dart'; // Import your DatabaseHelper class

class ScoresPage extends StatefulWidget {
  @override
  _ScoresPageState createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {
  late List<Map<String, dynamic>> _scores = [];

  @override
  void initState() {
    super.initState();
    _getScoresFromDatabase();
  }

  // Function to fetch scores from the database
  void _getScoresFromDatabase() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> scores = await dbHelper.getScoreMapList();
    setState(() {
      _scores = scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores'),
      ),
      body: Center(
        child: _scores.isEmpty
            ? Text('Aucun score trouvé')
            : ListView.builder(
                itemCount: _scores.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_scores[index]['name']),
                    subtitle: Text('Score: ${_scores[index]['score']}'),
                  );
                },
              ),
      ),
    );
  }
}
