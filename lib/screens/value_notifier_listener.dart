import 'package:flutter/material.dart';

class ValueNotifierListener extends StatelessWidget {
  const ValueNotifierListener({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listener"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Hello World!!"),
      ),
    );
  }
}
