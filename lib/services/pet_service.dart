import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pet.dart';

class PetService {
  static const String baseUrl = 'https://petstore.swagger.io/v2';
  
  // Get all available pets
  static Future<List<Pet>> getAvailablePets() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/pet/findByStatus?status=available'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Pet.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }

  // Get pets by status
  static Future<List<Pet>> getPetsByStatus(String status) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/pet/findByStatus?status=$status'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Pet.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }

  // Get pet by ID
  static Future<Pet> getPetById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/pet/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Pet.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }
}
