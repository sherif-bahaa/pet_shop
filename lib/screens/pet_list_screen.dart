// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import '../providers/pet_provider.dart';
// import '../widgets/pet_card.dart';
// import '../widgets/loading_shimmer.dart';
// import '../models/pet.dart';
// import 'pet_detail_screen.dart';

// class PetListScreen extends StatefulWidget {
//   const PetListScreen({super.key});

//   @override
//   State<PetListScreen> createState() => _PetListScreenState();
// }

// class _PetListScreenState extends State<PetListScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedCategory = '';
//   int currentIndex = 0;

//   final List<IconData> icons = [
//     Icons.home,
//     Icons.history,
//     Icons.shopping_bag_outlined,
//     Icons.person_outline,
//   ];
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<PetProvider>().loadAvailablePets();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 8,
//               offset: Offset(0, -2),
//             ),
//           ],
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(icons.length, (index) {
//             bool isSelected = index == currentIndex;
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     icons[index],
//                     size: 28,
//                     color: isSelected ? Colors.blue : Colors.grey,
//                   ),
//                   if (isSelected)
//                     Container(
//                       margin: const EdgeInsets.only(top: 4),
//                       width: 6,
//                       height: 6,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.blue,
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: const Text(
//             'user name',
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.notifications_none_outlined,
//               color: Colors.black,
//               size: 30,
//             ),
//             onPressed: () {
//               context.read<PetProvider>().loadAvailablePets();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Search and filter bar

//           // _buildSearchAndFilterBar(),
//           Stack(
//             children: [
//               Image.asset("assets/hom_image.png"),
//               Positioned(
//                 left: 150,
//                 top: 20,
//                 child: Text(
//                   """
//  Royal Canin
//  Adult Pomeraniann""",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 80,
//                 left: 160,
//                 child: Text(
//                   """
//  Get an interesting promo
//  here, without conditions""",
//                   style: TextStyle(fontSize: 14, color: Colors.white),
//                 ),
//               ),
//               Image.asset("assets/Image.png"),
//             ],
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16),
//               child: Text(
//                 "category ",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Consumer<PetProvider>(
//             builder: (context, petProvider, child) {
//               final categories = ['All', ...petProvider.uniqueCategories];

//               return SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 16),
//                   child: Row(
//                     children: categories.map((category) {
//                       final isSelected = category == 'All'
//                           ? _selectedCategory.isEmpty
//                           : _selectedCategory == category;

//                       return Padding(
//                         padding: const EdgeInsets.only(right: 8),
//                         child: FilterChip(
//                           label: Text(category),
//                           selected: isSelected,
//                           onSelected: (selected) {
//                             setState(() {
//                               if (category == 'All') {
//                                 _selectedCategory = '';
//                                 petProvider.resetFilter();
//                               } else {
//                                 _selectedCategory = selected ? category : '';
//                                 petProvider.filterPetsByCategory(
//                                   selected ? category : '',
//                                 );
//                               }
//                             });
//                           },
//                           backgroundColor: Colors.white,
//                           selectedColor: Colors.blue[100],
//                           checkmarkColor: Colors.blue[700],
//                           labelStyle: TextStyle(
//                             color: isSelected
//                                 ? Colors.blue[700]
//                                 : Colors.grey[700],
//                             fontWeight: isSelected
//                                 ? FontWeight.w600
//                                 : FontWeight.normal,
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               );
//             },
//           ),
//           // Pet list
//           Expanded(
//             child: Consumer<PetProvider>(
//               builder: (context, petProvider, child) {
//                 if (petProvider.isLoading) {
//                   return const LoadingShimmer();
//                 }

//                 if (petProvider.error != null) {
//                   return _buildErrorWidget(petProvider.error!);
//                 }

//                 if (petProvider.filteredPets.isEmpty) {
//                   return _buildEmptyWidget();
//                 }

//                 return _buildPetGrid(petProvider.filteredPets);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchAndFilterBar() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.blue[50],
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Search bar
//           TextField(
//             controller: _searchController,
//             decoration: InputDecoration(
//               hintText: 'Search for a pet...',
//               prefixIcon: const Icon(Icons.search),
//               suffixIcon: IconButton(
//                 icon: const Icon(Icons.clear),
//                 onPressed: () {
//                   _searchController.clear();
//                   context.read<PetProvider>().resetFilter();
//                 },
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide.none,
//               ),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 12,
//               ),
//             ),
//             onChanged: (value) {
//               context.read<PetProvider>().filterPetsByName(value);
//             },
//           ),

//           const SizedBox(height: 12),

//           // Category filter
//           Consumer<PetProvider>(
//             builder: (context, petProvider, child) {
//               final categories = ['All', ...petProvider.uniqueCategories];

//               return SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: categories.map((category) {
//                     final isSelected = category == 'All'
//                         ? _selectedCategory.isEmpty
//                         : _selectedCategory == category;

//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8),
//                       child: FilterChip(
//                         label: Text(category),
//                         selected: isSelected,
//                         onSelected: (selected) {
//                           setState(() {
//                             if (category == 'All') {
//                               _selectedCategory = '';
//                               petProvider.resetFilter();
//                             } else {
//                               _selectedCategory = selected ? category : '';
//                               petProvider.filterPetsByCategory(
//                                 selected ? category : '',
//                               );
//                             }
//                           });
//                         },
//                         backgroundColor: Colors.white,
//                         selectedColor: Colors.blue[100],
//                         checkmarkColor: Colors.blue[700],
//                         labelStyle: TextStyle(
//                           color: isSelected
//                               ? Colors.blue[700]
//                               : Colors.grey[700],
//                           fontWeight: isSelected
//                               ? FontWeight.w600
//                               : FontWeight.normal,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPetGrid(List<Pet> pets) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.75,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//       ),
//       itemCount: pets.length,
//       itemBuilder: (context, index) {
//         final pet = pets[index];
//         return PetCard(
//           pet: pet,
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PetDetailScreen(pet: pet),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildErrorWidget(String error) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
//           const SizedBox(height: 16),
//           Text(
//             'An error occurred',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[700],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             error,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton.icon(
//             onPressed: () {
//               context.read<PetProvider>().loadAvailablePets();
//             },
//             icon: const Icon(Icons.refresh),
//             label: const Text('Retry'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue[600],
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyWidget() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.pets_outlined, size: 64, color: Colors.grey[400]),
//           const SizedBox(height: 16),
//           Text(
//             'No pets found',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[700],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Try changing your search criteria',
//             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//           ),
//         ],
//       ),
//     );
//   }
// }
