import 'package:flutter/material.dart';
import 'package:ltdd/auth.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();
  final TextEditingController confirmPasswordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text('Forgot Password',
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
                      child: Text('New Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          )),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter new password';
                        }
                        return null;
                      },
                      controller: confirmPasswordTEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter new password',
                        prefixIcon: Icon(Icons.ac_unit),
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
                      child: Text('Confirm Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          )),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter confirm password';
                        }
                        return null;
                      },
                      controller: passwordTEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter confirm password',
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
                          bool isUserExist(username) {
                            if (username == Authen.username) {
                              return true;
                            } else {
                              return false;
                            }
                          }

                          bool isPasswordMatch(password, confirmPassword) {
                            if (password == confirmPassword) {
                              return true;
                            } else {
                              return false;
                            }
                          }

                          Text snackBarText() {
                            if (isUserExist(usernameTEC.text)) {
                              if (isPasswordMatch(
                                  passwordTEC.text, confirmPasswordTEC.text)) {
                                return const Text('Change password success!');
                              } else {
                                return const Text('Password not match!');
                              }
                            } else {
                              return const Text('User not exist!');
                            }
                          }

                          SnackBar snackBar = SnackBar(
                            duration: const Duration(seconds: 1),
                            content: snackBarText(),
                          );
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            if (isUserExist(usernameTEC.text) &&
                                isPasswordMatch(passwordTEC.text,
                                    confirmPasswordTEC.text)) {
                              Authen.password = passwordTEC.text;
                              Navigator.pop(context, usernameTEC.text);
                            }
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
                        child:
                            const Text('Next', style: TextStyle(fontSize: 20))),
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Login',
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
