import 'package:flutter/material.dart';
import 'package:pet_shop/widgets/helper.dart';



class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Helper.getResponsiveWidth(context, width: 25), vertical: Helper.getResponsiveHeight(context, height: 90)),
        child: Column(
          children: [
            Text(
              'Meet your\nanimal needs\nhere',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Image.asset('assets/onboarding.png'),
            Text(
              'Get interesting promos here, register your account immediately so you can meet your animal needs.',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            SizedBox(
              height: Helper.getResponsiveHeight(context, height: 25),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7140FD),
                    padding: EdgeInsets.symmetric(
                        vertical:
                            Helper.getResponsiveWidth(context, width: 18)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'createAccount/');
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
