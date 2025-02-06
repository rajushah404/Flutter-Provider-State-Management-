import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/auth_provider.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  ValueNotifier<bool> passwordToggle = ValueNotifier<bool>(false);

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Create FocusNode for each TextFormField
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // Dispose the FocusNode to avoid memory leaks
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // Listen for errors and show a SnackBar
    if (authProvider.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.error!),
            backgroundColor: Colors.red,
          ),
        );
        authProvider.setError(null); // Clear the error after showing it
      });
    }

    return GestureDetector(
      // Detect taps outside the TextFormField
      onTap: () {
        // Unfocus both TextFormFields when tapping outside
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome back"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                focusNode: emailFocusNode, // Assign FocusNode
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: passwordToggle,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode, // Assign FocusNode
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
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Password Please..',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  );
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  authProvider.login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: authProvider.loading
                        ? CircularProgressIndicator()
                        : Text("Login"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
