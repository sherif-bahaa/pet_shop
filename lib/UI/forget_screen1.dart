import 'package:flutter/material.dart';
import 'package:pet_shop/widgets/helper.dart';



class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
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
                height:Helper.getResponsiveHeight(context, height: 85) ,
              ),


              TextFormField(
                decoration: InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: Helper.getResponsiveHeight(context, height: 45),
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
                  onPressed: (){
                    Navigator.pushNamed(context, 'resetPass/');
                  },
                  child: const Text(
                    "Next",
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