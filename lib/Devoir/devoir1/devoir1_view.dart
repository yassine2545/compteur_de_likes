import 'package:flutter/material.dart';

class Devoir1View extends StatefulWidget {
  const Devoir1View({super.key});

  @override
  State<Devoir1View> createState() => _Devoir1ViewState();
}

class _Devoir1ViewState extends State<Devoir1View> {
  int _likes = 0;
  String _message = 'Pas de likes ...';
  Icon _favoriteIcon = Icon(Icons.favorite, color: Colors.grey);

  void _incrementCounter() {
    setState(() {
      _likes++;
      if (_likes == 0) {
        _message = 'Pas de likes ...';
        _favoriteIcon = Icon(Icons.favorite, color: Colors.grey);
      } else if (_likes == 1 && _likes <= 9) {
        _message = 'Merci pour votre like !';
        _favoriteIcon = Icon(Icons.favorite, color: Colors.red);
      } else if (_likes == 10) {
        _message = 'Wow, populaire';
        _favoriteIcon = Icon(Icons.favorite, color: Colors.amber);
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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            IconButton(icon: _favoriteIcon, onPressed: () {}, iconSize: 100),

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
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _incrementCounter();
                        Icon(Icons.favorite, color: Colors.grey);
                        Text('Likes');
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        Text('Likes'),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _likes = 0;
                        _favoriteIcon = Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        );
                        _message = 'Pas de likes ...';
                      });
                    },
                    child: Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
