import 'package:flutter/material.dart';

class ProductModel {
  final int? id;
  final String image;
  final String title;
  final String description;
  final double price;
  final ValueNotifier<int> quantity;
  final ValueNotifier<bool> isFavorite;
  ProductModel({
    this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required int quantity,
    bool isFavorite = false, // Added isFavorite with a default value
  }) : quantity = ValueNotifier<int>(quantity),isFavorite = ValueNotifier<bool>(isFavorite);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] ?? 0,
      isFavorite:(json['isFavorite'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'price': price,
      'description': description,
      'quantity': quantity.value,
      'isFavorite': isFavorite.value, // Include isFavorite in toJson
    };
  }


  // List of products
  static List<ProductModel> products = [
    ProductModel(
      title: 'Double Whopper',
      price: 29.57,
      image: 'assets/images/image1.png',
      quantity: 0,
      description: 'A classic burger with two flame-grilled beef patties, cheese, lettuce, tomato, pickles, onions, and special sauce.',
      isFavorite: false, // Added isFavorite
    ),
    ProductModel(
      title: 'Steakhouse XI',
      price: 35.65,
      image: 'assets/images/image2.png',
      quantity: 0,
      description: 'A hearty burger featuring a thick flame-grilled beef patty, crispy bacon, cheese, and BBQ sauce.',
      isFavorite: false, // Added isFavorite
    ),
    ProductModel(
      title: 'Chicken Steakhous...',
      price: 37.39,
      image: 'assets/images/image3.png',
      quantity: 0,
      description: 'Grilled chicken breast with a rich steakhouse sauce, fresh vegetables, and cheese.',
      isFavorite: false, // Added isFavorite
    ),
    ProductModel(
      title: 'Steakhouse',
      price: 30.43,
      image: 'assets/images/image4.png',
      quantity: 0,
      description: 'A savory burger with a flame-grilled beef patty, crispy onions, cheese, and a smoky steakhouse sauce.',
      isFavorite: false, // Added isFavorite
    ),
    ProductModel(
      title: 'Quattro Cheese Gril...',
      price: 29.57,
      image: 'assets/images/image5.png',
      quantity: 0,
      description: 'A delicious grilled sandwich loaded with four types of melted cheese for a rich flavor.',
      isFavorite: false, // Added isFavorite
    ),
    ProductModel(
      title: 'Quattro Cheese Chi...',
      price: 29.57,
      image: 'assets/images/image6.png',
      quantity: 0,
      description: 'Grilled chicken and four types of cheese, perfectly melted in a toasted bun.',
      isFavorite: false, // Added isFavorite
    ),
  ];
}