import 'package:flutter/material.dart';
import 'package:pet_shop/Firebase/firebase_function.dart';
import 'package:pet_shop/widgets/helper.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _newPassController = TextEditingController();
  TextEditingController _oldPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Helper.getResponsiveHeight(context, height: 85),
              ),
              const Text(
                "Forgot \nPassword \n",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Water is life. Water is a basic human need. In \nvarious lines of life, humans need water.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: Helper.getResponsiveHeight(context, height: 27),
              ),
              TextFormField(
                controller: _newPassController,
                decoration: InputDecoration(
                  hintText: "Old Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: Helper.getResponsiveHeight(context, height: 20),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "New Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: Helper.getResponsiveHeight(context, height: 35),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7140FD),
                    padding: EdgeInsets.symmetric(vertical: Helper.getResponsiveWidth(context, width: 15)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    FirebaseFunctions.updatePassword(
                      oldPassword: _oldPassController.text,
                      newPassword: _newPassController.text,
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
                                  child: Text('Okey'))
                            ],
                          ),
                        );
                      },
                      onSuccess: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Success"),
                            content: Text('Password Reset Successfully'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login/');
                                  },
                                  child: Text('Log In'))
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
