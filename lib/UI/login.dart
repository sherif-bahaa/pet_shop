import 'package:flutter/material.dart';
import 'package:pet_shop/widgets/helper.dart';

import '../Firebase/firebase_function.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInScreen1State();
}

class _LogInScreen1State extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 80),
                ),
                const Text(
                  "Hello, \nWelcome Back!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 10),
                ),
                const Text(
                  "Water is life. Water is a basic human need. In \nvarious lines of life, humans need water.",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 30),
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill this';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 20),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill this';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'forgetPass1/');
                      },
                      child: Text(
                        'Forgrt Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xff337EFE),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 10),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        endIndent: 10,
                        indent: 30,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Or',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        endIndent: 30,
                        indent: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: Helper.getResponsiveWidth(
                            context,
                            width: 25,
                          ),
                        ),
                        elevation: 0,
                        backgroundColor: Color(0xffFFFFFF),
                        foregroundColor: Color(0xff337EFE),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      onPressed: () {
                        // FirebaseFunctions.signInWithGoogle(
                        //   onSuccess: () {
                        //     print("Google Sign-in Success!");
                        //   },
                        //   onError: (err) {
                        //     print("Error: $err");
                        //   },
                        // );
                      },
                      icon: const Icon(Icons.g_mobiledata, size: 30),
                      label: const Text(
                        "Google",
                        style: TextStyle(
                          color: Color(0xff337EFE),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?  ",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "createAccount/");
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          color: Color(0xff7140FD),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 15),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff7140FD),
                      padding: EdgeInsets.symmetric(
                        vertical: Helper.getResponsiveWidth(context, width: 18),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseFunctions.logIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                          onSucess: () {
                            Navigator.pushNamed(context, 'home/');
                          },
                          onError: (error) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text(error),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Okey'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "log in ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
