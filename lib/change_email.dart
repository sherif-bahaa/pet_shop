import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ChangeEmailPage(),
      theme: ThemeData(
        fontFamily: 'Montserrat', // يمكنك تغيير الخط حسب تفضيلك
      ),
    );
  }
}

class ChangeEmailPage extends StatelessWidget {
  final _emailController = TextEditingController();

   ChangeEmailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // زر الرجوع في الجزء الأيسر من الـ AppBar باستخدام Container و Icon
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0), // إضافة مساحة بادينغ على اليسار
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
                    offset: const Offset(0, 3), // تغيير الموضع
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF333333), // لون السهم
                size: 20,
              ),
            ),
            onPressed: () {
              // هنا يمكنك إضافة الكود للعودة إلى الصفحة السابقة
              Navigator.pop(context);
            },
          ),
        ),
        // عنوان الصفحة في المنتصف
        title: const Text(
          'Change Email',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // لضمان أن العنوان في المنتصف تمامًا
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل إدخال البريد الإلكتروني الجديد
            const Text(
              'New Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress, // نوع لوحة المفاتيح للبريد الإلكتروني
              decoration: InputDecoration(
                hintText: 'Enter new email',
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              ),
            ),
            
            const Spacer(),
            
            // زر "Save" في الأسفل
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // هنا يمكنك إضافة الكود الخاص بحفظ البريد الإلكتروني
                  // يمكنك الوصول إلى القيمة من خلال _emailController.text
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7140FD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
