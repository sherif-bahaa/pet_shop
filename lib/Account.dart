import 'package:flutter/material.dart';
import 'package:pet_shop/widgets/helper.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account> {
  bool isSeller = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Account',
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
        padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/hom_image.png',
                    width: 327,
                    height: 159,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                left: 0,
                right: 0,
                child: ClipOval(
                  child: Image.asset(
                    'assets/profava.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          const Center(
            child: Text(
              'Abduldul',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),

          const Text(
            "Name",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),

          TextField(
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "",
              hintStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
          ),

          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          const Text(
            "Username",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),

          TextField(
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "",
              hintStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
          ),

          SizedBox(height: Helper.getResponsiveHeight(context, height: 20)),
          const Text(
            "Email",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),

          TextField(
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "",
              hintStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
          ),
          SizedBox(height: Helper.getResponsiveHeight(context, height: 30)),
          Container(
            child: OutlinedButton(
              onPressed: () {},

              style: OutlinedButton.styleFrom(
                backgroundColor: Color(0xff7140FD),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
              ),
              child: Text(
                'Save Changes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
