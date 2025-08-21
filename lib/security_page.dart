import 'package:flutter/material.dart';
import 'package:pet_shop/change_email.dart';
import 'package:pet_shop/change_pass.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const SecurityPage(),
//       theme: ThemeData(
//         fontFamily: 'Montserrat',
//         scaffoldBackgroundColor: Colors.white,
//       ),
//     );
//   }
// }

// ===============================================
// صفحة الأمان (SecurityPage)
// ===============================================

class SecurityPage extends StatelessWidget {
  const SecurityPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF333333),
                size: 20,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Security',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Security',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            
            // خيار "Change Password"
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Icon(
                  Icons.vpn_key_outlined,
                  color: Colors.black54,
                ),
              ),
              title: const Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFC0C0C0),
                size: 16,
              ),
              onTap: () {
                // الانتقال إلى صفحة تغيير كلمة المرور
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ChangePasswordScreen()),
                );
              },
            ),
            const SizedBox(height: 10.0),
            
            // خيار "Change Email"
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Icon(
                  Icons.email_outlined,
                  color: Colors.black54,
                ),
              ),
              title: const Text(
                'Change Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFC0C0C0),
                size: 16,
              ),
              onTap: () {
                // الانتقال إلى صفحة تغيير البريد الإلكتروني
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ChangeEmailPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}