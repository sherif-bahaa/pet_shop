import 'package:flutter/material.dart';
import 'package:pet_shop/Firebase/firebase_function.dart';
import 'package:pet_shop/widgets/helper.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Create New \nAccount \n",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Water is life. Water is a basic human need. In \nvarious lines of life, humans need water.",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 30),
                ),
                TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 20),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 20),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: Helper.getResponsiveHeight(context, height: 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account?  ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "login/");
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: Color(0xff7140FD),
                          fontSize: 15,
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
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      FirebaseFunctions.createAccount(
                        email: _emailController.text,
                        password: _passwordController.text,
                        onSucess: () {
                          Navigator.pushNamed(context, 'login/');
                        },
                        onError: () {
                          (error) {
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
                          };
                        },
                        name: _userNameController.text,
                      );
                    },
                    child: const Text(
                      "sing up",
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
