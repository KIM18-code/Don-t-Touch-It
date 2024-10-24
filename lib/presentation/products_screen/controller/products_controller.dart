import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grocery_app/presentation/products_screen/models/products_model.dart'; // Assuming you have a ProductModel class

class ProductsController extends GetxController {
  // Observable product list
  var productList = <ProductsModel>[].obs;

  // TextEditingController for managing input fields
  final buttonswebsolController = TextEditingController();
  final buttonswebsolOneController = TextEditingController();
  final buttonswebsolTwoController = TextEditingController();
  final buttonswebsolThreeController = TextEditingController();

  // Observable for loading and error handling
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Fetch products on initialization
  }

  // Fetch product data from API
  Future<void> fetchProducts() async {
    try {
      isLoading(true); // Set loading state to true while fetching

      // Make the GET request to the API
      final response = await http.get(Uri.parse('https://localhost:7130/api/spare-parts'));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of ProductModel objects
        List<dynamic> data = json.decode(response.body);

        // Map the parsed JSON to the ProductModel and update the observable productList
        productList.value = data.map((json) => ProductsModel.fromJson(json)).toList();
        
        errorMessage.value = ''; // Clear any previous error
      } else {
        // Handle non-200 responses
        errorMessage.value = 'Failed to load products: ${response.statusCode}';
      }
    } catch (e) {
      // Handle errors (e.g., network issues, JSON parsing errors)
      errorMessage.value = 'Error fetching products: $e';
    } finally {
      isLoading(false); // Set loading to false when data fetching is complete
    }
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is destroyed
    buttonswebsolController.dispose();
    buttonswebsolOneController.dispose();
    buttonswebsolTwoController.dispose();
    buttonswebsolThreeController.dispose();
    super.onClose();
  }
}


  // Fetch product data (this could be from an API or local storage)
  // void fetchProducts() {
  //   // Example static data (replace this with actual data fetching logic)
  //   var fetchedProducts = [
  //     ProductModel(
  //         name: 'Radhuni Shemai',
  //         price: '60',
  //         imagePath: 'assets/images/radhuni_shemai.png'),
  //     ProductModel(
  //         name: 'Cheese Puffs Chips',
  //         price: '700',
  //         imagePath: 'assets/images/cheese_puffs.png'),
  //     ProductModel(
  //         name: 'Nescafe Classic',
  //         price: '25',
  //         imagePath: 'assets/images/nescafe_classic.png'),
  //     ProductModel(
  //         name: 'Akher Chini De',
  //         price: '30',
  //         imagePath: 'assets/images/akher_chini.png'),
  //   ];

  //   // Update the product list
  //   productList.value = fetchedProducts;
  // }

