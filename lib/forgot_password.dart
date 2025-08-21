import 'package:flutter/material.dart';

class forgot_password extends StatelessWidget {
   var isChecked = false;
  String? selectedOption = "option1";
  var isEnabled = true;
  bool _isExpanded = false;
  @override
  Matrix4 _transformMatrix = Matrix4.identity();
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body:  AnimatedContainer(
              duration: Duration(seconds: 1),

              width: _isExpanded ? 100 : 200,
              height: _isExpanded ? 100 : 200,
              transform: _transformMatrix,
              color: _isExpanded
                  ? Colors.red
                  : const Color.fromARGB(9, 33, 149, 243),
              curve: Curves.linear,
              // child: Center(child: Text('Animated!')),
              child: Center(
                child: Text(
                  'Animated!',
                  style: TextStyle(backgroundColor: Color(0xff000000)),
                ),
              ),
            ),
    );
  }
}
