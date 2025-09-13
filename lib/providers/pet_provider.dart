import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../services/pet_service.dart';

class PetProvider extends ChangeNotifier {
  List<Pet> _pets = [];
  List<Pet> _filteredPets = [];
  bool _isLoading = false;
  String? _error;
  String _selectedStatus = 'available';

  List<Pet> get pets => _pets;
  List<Pet> get filteredPets => _filteredPets;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedStatus => _selectedStatus;

  Future<void> loadAvailablePets() async {
    _setLoading(true);
    _clearError();
    
    try {
      _pets = await PetService.getAvailablePets();
      _filteredPets = _pets;
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  
  void filterPetsByCategory(String category) {
    if (category.isEmpty) {
      _filteredPets = _pets;
    } else {
      _filteredPets = _pets.where((pet) => 
        pet.category.name.toLowerCase().contains(category.toLowerCase())
      ).toList();
    }
    notifyListeners();
  }

  void filterPetsByName(String name) {
    if (name.isEmpty) {
      _filteredPets = _pets;
    } else {
      _filteredPets = _pets.where((pet) => 
        pet.name.toLowerCase().contains(name.toLowerCase())
      ).toList();
    }
    notifyListeners();
  }

  void resetFilter() {
    _filteredPets = _pets;
    notifyListeners();
  }

  List<String> get uniqueCategories {
    final categories = _pets.map((pet) => pet.category.name).toSet().toList();
    categories.sort();
    return categories;
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }
}
