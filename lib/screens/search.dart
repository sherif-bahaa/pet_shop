import 'package:flutter/material.dart';
import 'package:pet_shop/providers/pet_provider.dart';
import 'package:provider/provider.dart';

class Search_page extends StatefulWidget {
  const Search_page({super.key});

  @override
  State<Search_page> createState() => _Search_pageState();
}

class _Search_pageState extends State<Search_page> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a pet...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    context.read<PetProvider>().resetFilter();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: (value) {
                context.read<PetProvider>().filterPetsByName(value);
              },
            ),

            const SizedBox(height: 12),

            // Category filter
            Consumer<PetProvider>(
              builder: (context, petProvider, child) {
                final categories = ['All', ...petProvider.uniqueCategories];

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                                _selectedCategory = selected ? category : '';
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
