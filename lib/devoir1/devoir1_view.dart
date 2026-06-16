import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _likes = 0;
  String _message = 'Pas de likes ...';

  void _incrementCounter() {
    setState(() {
      _likes++;
      if (_likes == 0) {
        _message = 'Pas de likes ...';
      } else if (_likes > 1 && _likes <= 9) {
        _message = 'Merci pour votre like !';
      } else if (_likes == 10) {
        _message = 'Wow, populaire';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(child: Text("Compteur De Likes")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Mes Likes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite, size: 100),
              color: Colors.red,
              onPressed: _incrementCounter,
            ),

            Text(
              '$_likes',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_message',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _likes = 0;
                      _message = 'Pas de likes ...';
                    });
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _likes = 0;
                  _message = 'Pas de likes ...';
                });
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
