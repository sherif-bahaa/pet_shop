import 'package:flutter/material.dart';
import 'package:pet_shop/ProfilePage.dart';
import 'package:pet_shop/providers/login_provider.dart';
import 'package:provider/provider.dart';

class SellerModePage extends StatefulWidget {
  const SellerModePage({super.key});

  @override
  State<SellerModePage> createState() => _SellerModePageState();
}

class _SellerModePageState extends State<SellerModePage> {
  int selectedTab = 0;
  static const purple = Color(0xFF7140FD);

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 390),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Profile / Seller Mode toggle
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _topBtn("Profile", false, context),
                      const SizedBox(width: 6),
                      _topBtn("Seller Mode", true, context),
                    ],
                  ),
                ),

                // Cover + Profile circle
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: const DecorationImage(
                            image: AssetImage('assets/background2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -36,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/profile_photo.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),
                Text(
                  appProvider.userModel!.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                // Stats
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _Stat(number: '109', label: 'Followers'),
                      _Stat(number: '992', label: 'Following'),
                      _Stat(number: '80', label: 'Sales'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _segBtn(
                      'Product',
                      0,
                      selectedTab,
                      (i) => setState(() => selectedTab = i),
                    ),
                    const SizedBox(width: 8),
                    _segBtn(
                      'Sold',
                      1,
                      selectedTab,
                      (i) => setState(() => selectedTab = i),
                    ),
                    const SizedBox(width: 8),
                    _segBtn(
                      'Stats',
                      2,
                      selectedTab,
                      (i) => setState(() => selectedTab = i),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Products
                if (selectedTab == 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.75,
                      children: const [
                        _ProductCard(
                          image: 'assets/Image.png',
                          name: 'RC Kitten',
                          price: '20.99',
                        ),
                        _ProductCard(
                          image: 'assets/Image.png',
                          name: 'RC Persian',
                          price: '22.99',
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topBtn(String text, bool active, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (text == "Profile" && !active) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: active ? purple : Colors.white,
        foregroundColor: active ? Colors.white : Colors.black87,
        shape: const StadiumBorder(),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  static Widget _segBtn(
    String text,
    int index,
    int selected,
    Function(int) onTap,
  ) {
    const purple = Color(0xFF7140FD);
    final bool isActive = selected == index;
    return OutlinedButton(
      onPressed: () => onTap(index),
      style: OutlinedButton.styleFrom(
        backgroundColor: isActive ? purple : Colors.grey.shade100,
        foregroundColor: isActive ? Colors.white : Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: const StadiumBorder(),
        side: BorderSide(
          color: isActive ? Colors.transparent : Colors.grey.shade200,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String number;
  final String label;
  const _Stat({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const _ProductCard({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF7140FD);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(child: Image.asset(image, fit: BoxFit.contain)),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "\$$price",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Positioned(
          right: -8,
          bottom: -8,
          child: Material(
            color: purple,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.add, size: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
