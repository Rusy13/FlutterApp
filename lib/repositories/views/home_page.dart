import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/registrationpage');
              },
              tooltip: 'Main',
              child: const Icon(Icons.airplanemode_on),
            ),
            const SizedBox(height: 16), // Добавьте отступ между кнопкой и текстом
            const Text(
              'Go to main',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
