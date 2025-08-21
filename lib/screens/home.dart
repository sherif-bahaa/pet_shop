import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/Firebase/firebase_function.dart';
import 'package:pet_shop/Notification.dart';
import 'package:pet_shop/SellerModePage.dart';
import 'package:pet_shop/providers/pet_provider.dart';
import 'package:pet_shop/screens/cart_page.dart';
import 'package:pet_shop/screens/pet_detail_screen.dart';
import 'package:pet_shop/screens/pet_list_screen.dart';
import 'package:pet_shop/screens/search.dart';
import 'package:pet_shop/security_page.dart';
import 'package:pet_shop/widgets/loading_shimmer.dart';
import 'package:provider/provider.dart';

@override
class HomePageState extends StatefulWidget {
  HomePageState({super.key});

  @override
  State<HomePageState> createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  int _selectedIndex = 0;
  int _currentIndex = 0;
  String _selectedCategory = '';

  // قائمة الصفحات
  final List<Widget> _pages = [
    HomePageState(),
    Search_page(),
    CartPage(),
    SecurityPage(),
  ];
  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PetProvider>().loadAvailablePets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'Location:\nCairo, Egypt',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Choose Location",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ListTile(
                            leading: const Icon(Icons.location_on),
                            title: const Text("Cairo, Egypt"),
                            onTap: () {
                              print("Location selected: Cairo, Egypt");
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.location_on),
                            title: const Text("Alexandria, Egypt"),
                            onTap: () {
                              print("Location selected: Alexandria, Egypt");
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.location_on),
                            title: const Text("Giza, Egypt"),
                            onTap: () {
                              print("Location selected: Giza, Egypt");
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search_page()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.purpleAccent,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.purpleAccent,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF7B3EFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -20,
                    right: -30,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9B6BFF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 40,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9B6BFF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(-30, 0),
                        child: Image.asset(
                          "assets/Image.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Royal Canin\nAdult Pomeranian",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Get an interesting promo\nhere, without conditions",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(color: Color(0xFF9B6BFF)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Consumer<PetProvider>(
                    builder: (context, petProvider, child) {
                      final categories = [
                        'All',
                        ...petProvider.uniqueCategories,
                      ];

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: categories.map((category) {
                              final isSelected = category == 'All'
                                  ? _selectedCategory.isEmpty
                                  : _selectedCategory == category;

                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: FilterChip(
                                  label: Text(category),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    setState(() {
                                      if (category == 'All') {
                                        _selectedCategory = '';
                                        petProvider.resetFilter();
                                      } else {
                                        _selectedCategory = selected
                                            ? category
                                            : '';
                                        petProvider.filterPetsByCategory(
                                          selected ? category : '',
                                        );
                                      }
                                    });
                                  },
                                  backgroundColor: Colors.white,
                                  selectedColor: Colors.blue[100],
                                  checkmarkColor: Colors.blue[700],
                                  labelStyle: TextStyle(
                                    color: isSelected
                                        ? Colors.blue[700]
                                        : Colors.grey[700],
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Sellers',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationPage(),
                              // BestSellerPage(products: products),
                            ),
                          );
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(color: Color(0xffad88fb)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 260,
                    child: Consumer<PetProvider>(
                      builder: (context, petProvider, child) {
                        // if (petProvider.isLoading) {
                        //   return const LoadingShimmer();
                        // }

                        final pets = petProvider.filteredPets;
                        int price = 20;

                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.6,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                          scrollDirection: Axis.vertical,
                          itemCount: pets.length,
                          itemBuilder: (context, index) {
                            final pet = pets[index];

                            bool isFavorite = false;

                            return StatefulBuilder(
                              builder: (context, setState) {
                                return SizedBox(
                                  width: 200,
                                  height: 300,
                                  //    margin: const EdgeInsets.symmetric(horizontal: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PetDetailScreen(pet: pet),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      elevation: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                    top: Radius.circular(16),
                                                  ),
                                              child: CachedNetworkImage(
                                                imageUrl: pet.photoUrls.first,
                                                errorWidget:
                                                    (context, url, error) {
                                                      return SizedBox(
                                                        child: Image.asset(
                                                          "assets/download.png",
                                                        ),
                                                      );
                                                    },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            pet.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "${price * index + 20 * 0.79} \$ ",
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  try {
                                                    FirebaseFunctions.addToCart(
                                                      pet,
                                                    );

                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          "${pet.name} added to cart",
                                                        ),
                                                      ),
                                                    );
                                                  } on Exception catch (e) {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          "${e.toString()} added to cart",
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color(
                                                    0xFF7B3EFF,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.star,
                                                  color: isFavorite
                                                      ? const Color(0xFF7B3EFF)
                                                      : Colors.grey,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isFavorite = !isFavorite;
                                                  });

                                                  if (isFavorite) {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          "${pet.name} added to favorites",
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF7B3EFF),
          unselectedItemColor: Colors.grey.shade400,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              if (index == 0) {
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search_page()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellerModePage()),
                );
              }
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 26),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star, size: 26),
              label: ' Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 26),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 26),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
