import 'package:flutter/material.dart';

final class ValueNotifierListener extends StatelessWidget {
  ValueNotifierListener({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> passwordToggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listener"),
        centerTitle: true,
      ),
      body: Column(
        spacing: 10,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 10,
                right: 10,
              ),
              child: ValueListenableBuilder(
                  valueListenable: passwordToggle,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: passwordToggle.value,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          child: passwordToggle.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onTap: () {
                            passwordToggle.value = !passwordToggle.value;
                          },
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.blue),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Password Please..',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    );
                  })),
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
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
