import 'package:flutter/material.dart';

final class ValueNotifierListener extends StatelessWidget {
  ValueNotifierListener({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Listener"),
        centerTitle: true,
      ),
      body: Column(

        tulsi mill 300k 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              // Label text and style
              labelText: 'Enter your text',
              labelStyle: TextStyle(color: Colors.blue),

              // Enabled border (when the field is not focused)
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),

              // Focused border (when the field is focused)
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),

              // Disabled border (when the field is disabled)
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),

              // Error border (when there is an error)
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),

              // Focused error border (when there is an error and the field is focused)
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),

              // Hint text and style
              hintText: 'Type something...',
              hintStyle: TextStyle(color: Colors.grey),

              // Fill color and filled property
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
