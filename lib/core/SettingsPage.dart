import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/Account.dart';
import 'package:pet_shop/FAQ_page.dart';
import 'package:pet_shop/Firebase/firebase_function.dart';
import 'package:pet_shop/Notification.dart';
import 'package:pet_shop/Privacy.dart';
import 'package:pet_shop/providers/login_provider.dart';
import 'package:pet_shop/security_page.dart';
import 'package:pet_shop/widgets/helper.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool isSeller = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings Page',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          //_______________________ Section Title Account _______________________________
          Text(
            'Account',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),

          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),

          //_______________________ Account _______________________________
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xffF3F3F3),
              child: const Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 28,
              ),
            ),
            title: const Text(
              "Account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Account()));
            },
          ),

          //_______________________ Address _______________________________
          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xffF3F3F3),
              child: const Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
            title: const Text(
              "Address",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
            onTap: () {},
          ),

          //_______________________ Notification _______________________________
          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xffF3F3F3),
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
            title: const Text(
              "Notification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),

          //_______________________ Payment Method _______________________________
          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xffF3F3F3),
              child: const Icon(
                Icons.payment_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
            title: const Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
            onTap: () {},
          ),

          //_______________________ Privacy _______________________________
          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xffF3F3F3),
              child: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
            title: const Text(
              "Privacy",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Privacy()));
            },
          ),

          //_______________________ Security _______________________________
          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xffF3F3F3),
              child: const Icon(
                Icons.security_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
            title: const Text(
              "Security",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SecurityPage()));
            },
          ),

          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),

          //_______________________ Section Title Help _______________________________
          Text(
            'Help',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),

          //_______________________ Contact Us _______________________________
          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xffF3F3F3),
              child: const Icon(
                Icons.contact_support_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
            title: const Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
            onTap: () {},
          ),

          //_______________________ FAQ _______________________________
          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xffF3F3F3),
              child: const Icon(
                Icons.help_outline,
                color: Colors.black,
                size: 28,
              ),
            ),
            title: const Text(
              "FAQ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => FAQPage()));
            },
          ),

          Container(
            child: OutlinedButton(
              onPressed: () {
                FirebaseFunctions.logOut();
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xff7140FD), width: 2),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
              ),
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Color(0xff7140FD),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
