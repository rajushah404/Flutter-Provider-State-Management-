import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Provider"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child:
                Consumer<CountProvider>(builder: (context, value, child) {
              return Text(value.count.toString(),
                  style: TextStyle(fontSize: 50));
            }))
          ],
        ),
        floatingActionButton:
            Consumer<CountProvider>(builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              value.setCount();
            },
            child: Icon(Icons.add),
          );
        }));
  }
}
