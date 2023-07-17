import 'package:flutter/material.dart';

class BitPage extends StatelessWidget {
  const BitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bitrate = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Rate_Page')),
      body: Center(
        child: Text(
          'Rate is  $bitrate',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
