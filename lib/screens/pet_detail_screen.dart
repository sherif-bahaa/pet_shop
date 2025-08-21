import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/pet.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;

  const PetDetailScreen({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pet.name.isNotEmpty ? pet.name : 'Pet Details',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pet image
            _buildPetImage(),
            
            // Pet information
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pet name and status
                  _buildHeaderSection(),
                  
                  const SizedBox(height: 24),
                  
                  // Basic information
                  _buildBasicInfoSection(),
                  
                  const SizedBox(height: 24),
                  
                  // Photos
                  if (pet.photoUrls.isNotEmpty) ...[
                    _buildPhotosSection(),
                    const SizedBox(height: 24),
                  ],
                  
                  // Tags
                  if (pet.tags.isNotEmpty) ...[
                    _buildTagsSection(),
                    const SizedBox(height: 24),
                  ],
                  
                  // Additional information
                  _buildAdditionalInfoSection(),
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
        height: 300,
        width: double.infinity,
        color: Colors.grey[200],
        child: Icon(
          _getCategoryIcon(pet.category.name),
          size: 80,
          color: Colors.grey[400],
        ),
      );
    }

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: pet.photoUrls.first,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
          child: Icon(
            _getCategoryIcon(pet.category.name),
            size: 80,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pet.name.isNotEmpty ? pet.name : 'No Name',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                pet.category.name.isNotEmpty ? pet.category.name : 'Unknown',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        _buildStatusChip(),
      ],
    );
  }

  Widget _buildBasicInfoSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('ID', pet.id.toString()),
            _buildInfoRow('Category', pet.category.name.isNotEmpty ? pet.category.name : 'Unknown'),
            _buildInfoRow('Status', _getStatusText(pet.status)),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotosSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Photos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pet.photoUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: pet.photoUrls[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: Icon(
                            _getCategoryIcon(pet.category.name),
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tags',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: pet.tags.map((tag) => Chip(
                label: Text(
                  tag.name.isNotEmpty ? tag.name : 'Unknown',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: Colors.blue[600],
                side: BorderSide.none,
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfoSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Number of Photos', pet.photoUrls.length.toString()),
            _buildInfoRow('Number of Tags', pet.tags.length.toString()),
            _buildInfoRow('Category ID', 'ID: ${pet.category.id}'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip() {
    Color chipColor;
    String statusText = _getStatusText(pet.status);
    
    switch (pet.status.toLowerCase()) {
      case 'available':
        chipColor = Colors.green;
        break;
      case 'pending':
        chipColor = Colors.orange;
        break;
      case 'sold':
        chipColor = Colors.red;
        break;
      default:
        chipColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: chipColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          fontSize: 12,
          color: chipColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'available':
        return 'Available';
      case 'pending':
        return 'Pending';
      case 'sold':
        return 'Sold';
      default:
        return status;
    }
  }

  IconData _getCategoryIcon(String category) {
    final categoryLower = category.toLowerCase();
    
    if (categoryLower.contains('dog') || categoryLower.contains('كلب')) {
      return Icons.pets;
    } else if (categoryLower.contains('cat') || categoryLower.contains('قط')) {
      return Icons.pets;
    } else if (categoryLower.contains('fish') || categoryLower.contains('سمك')) {
      return Icons.water;
    } else if (categoryLower.contains('bird') || categoryLower.contains('طائر')) {
      return Icons.flutter_dash;
    } else {
      return Icons.pets;
    }
  }
}
