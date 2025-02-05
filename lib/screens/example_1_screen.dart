import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/example_1_provider.dart';

class Example1Screen extends StatefulWidget {
  const Example1Screen({super.key});

  @override
  State<Example1Screen> createState() => _Example1ScreenState();
}

class _Example1ScreenState extends State<Example1Screen> {
  @override
  Widget build(BuildContext context) {
    print("build ho raha hao");
    return Scaffold(
      appBar: AppBar(
        title: Text("Example One"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Example1Provider>(builder: (context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (newValue) {
                value.setValue(newValue);
              },
            );
          }),
          Consumer<Example1Provider>(builder: (context, value, vhild) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value),
                    ),
                    child: Center(child: Text("Container One")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(value.value),
                    ),
                    child: Center(child: Text("Container Two")),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
