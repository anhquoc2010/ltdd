import 'package:flutter/material.dart';
import 'package:ltdd/auth.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text('Login',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                )),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Username',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          )),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      controller: usernameTEC,
                      decoration: const InputDecoration(
                        hintText: 'Enter username',
                        prefixIcon: Icon(Icons.accessibility),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          )),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      controller: passwordTEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.ac_unit),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 64),
                    ElevatedButton(
                        onPressed: () {
                          bool isAuthen(username, password) {
                            if (username == Authen.username &&
                                password == Authen.password) {
                              return true;
                            } else {
                              return false;
                            }
                          }

                          SnackBar snackBar = SnackBar(
                            content: isAuthen(
                                    usernameTEC.text, passwordTEC.text)
                                ? const Text('Login success!')
                                : const Text('Invalid username or password!'),
                          );
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(186, 54),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        child: const Text('Login',
                            style: TextStyle(fontSize: 20))),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?',
                            style:
                                TextStyle(color: Colors.brown, fontSize: 16)),
                      ),
                      const Text('|', style: TextStyle(fontSize: 16)),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Register',
                            style: TextStyle(color: Colors.red, fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
