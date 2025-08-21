import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/pet.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback? onTap;

  const PetCard({super.key, required this.pet, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pet image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: AspectRatio(aspectRatio: 16 / 9, child: _buildPetImage()),
            ),

            // Pet information
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pet name
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          pet.name.isNotEmpty ? pet.name : 'No Name',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      _buildStatusChip(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.deepPurpleAccent,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.white, size: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetImage() {
    if (pet.photoUrls.isEmpty || pet.photoUrls.first.isEmpty) {
      return Container(
        color: Colors.grey[200],
        child: Icon(
          _getCategoryIcon(pet.category.name),
          size: 48,
          color: Colors.grey[400],
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: pet.photoUrls.first,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[200],
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[200],
        child: Icon(
          _getCategoryIcon(pet.category.name),
          size: 48,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    Color chipColor;
    String statusText;

    switch (pet.status.toLowerCase()) {
      case 'available':
        chipColor = Colors.green;
        statusText = 'Available';
        break;
      case 'pending':
        chipColor = Colors.orange;
        statusText = 'Pending';
        break;
      case 'sold':
        chipColor = Colors.red;
        statusText = 'Sold';
        break;
      default:
        chipColor = Colors.grey;
        statusText = pet.status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: chipColor.withOpacity(0.3), width: 1),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          fontSize: 10,
          color: chipColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    final categoryLower = category.toLowerCase();

    if (categoryLower.contains('dog') || categoryLower.contains('كلب')) {
      return Icons.pets;
    } else if (categoryLower.contains('cat') || categoryLower.contains('قط')) {
      return Icons.pets;
    } else if (categoryLower.contains('fish') ||
        categoryLower.contains('سمك')) {
      return Icons.water;
    } else if (categoryLower.contains('bird') ||
        categoryLower.contains('طائر')) {
      return Icons.flutter_dash;
    } else {
      return Icons.pets;
    }
  }
}
