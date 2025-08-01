# kartngo_task

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



1- prompt: Design this screen with the same design, colors, fonts, and everything else. using flutter?
and send to design image

answer:
I will design the screen based on the provided image and OCR text.
Here's my plan:
Set up the basic HomeScreen structure: I'll use a Scaffold with an AppBar and a body.
Implement the AppBar: This will include the title "التصنيفات" (Categories) and a search icon.
Create the category filter chips: I'll use a SingleChildScrollView with Row and ChoiceChip or custom widgets to replicate the filter buttons ("أفضل العروض", "مستورد", "أجبان قابلة للدهن", "أجبان").
Design the product grid: I'll use a GridView.builder to display the product items. Each item will be a Card or Container with an image, title, price, and quantity selector.
Develop the product item widget: This custom widget will encapsulate the layout for each product, including the image, product name, price, and the quantity increment/decrement buttons.
Implement the bottom cart summary: I'll use a Positioned widget or Align within a Stack to place the cart summary bar at the bottom, showing the total price and a "عرض السلة" (View Cart) button.
Define colors and text styles: I'll extract colors from the image and define appropriate TextStyles to match the design.
Let's start by modifying the main.dart file to include the HomeScreen design.

and write the code.



2- prompt: Divide this widget into smaller widgets to keep the code organized ?? 
and send to widget


answer:
I will refactor the BuildProductItem widget by dividing it into smaller widgets to improve readability and maintainability. The refactoring will keep the stateful behavior and fix the quantity update logic.
Plan:
Extract _ProductImage widget for the circular product image and logo.
Extract _ProductDetails widget for the product name and price.
Extract _QuantitySelector widget for the quantity increment/decrement controls.
Fix the quantity update logic to correctly update widget.product['quantity'] instead of widget.product[widget.index]['quantity'].
Here is the refactored complete code:

and write the code.

This refactoring keeps the original functionality, fixes the quantity update logic, and organizes the widget into smaller components for better readability and maintainability.


3- prompt:add description to every model ?
ProductModel( title: 'Double Whopper', price: 29.57, image: 'assets/images/image1.png', quantity: 0, ), ProductModel( title: 'Steakhouse XI', price: 35.65, image: 'assets/images/image2.png', quantity: 0, ), ProductModel( title: 'Chicken Steakhous...', price: 37.39, image: 'assets/images/image3.png', quantity: 0, ), ProductModel( title: 'Steakhouse', price: 30.43, image: 'assets/images/image4.png', quantity: 0, ), ProductModel( title: 'Quattro Cheese Gril...', price: 29.57, image: 'assets/images/image5.png', quantity: 0, ), ProductModel( title: 'Quattro Cheese Chi...', price: 29.57, image: 'assets/images/image6.png', quantity: 0, ), ];?

answer:
To add a description to every ProductModel in the provided list, you need to include the description parameter in each ProductModel constructor call.
Here's the refactored code:
import 'package:flutter/material.dart';

class ProductModel {
final int? id;
final String image;
final String title;
final String description;
final double price;
final ValueNotifier<int> quantity;

ProductModel({
this.id,
required this.image,
required this.title,
required this.price,
required this.description,
required int quantity, // ✅ استقباله كـ int هنا
}) : quantity = ValueNotifier<int>(quantity); // ✅ تحويله إلى ValueNotifier

/// ✅ factory: تحويل JSON إلى Model
factory ProductModel.fromJson(Map<String, dynamic> json) {
return ProductModel(
id: json['id'],
image: json['image'],
title: json['title'],
description: json['description'],
price: (json['price'] as num).toDouble(),
quantity: json['quantity'] ?? 0, // ✅ safe default
);
}

/// ✅ تحويل Model إلى JSON: نحول quantity إلى int فقط
Map<String, dynamic> toJson() {
return {
'id': id,
'image': image,
'title': title,
'price': price,
'description': description,
'quantity': quantity.value, // ✅ نأخذ القيمة فقط
};
}

/// ✅ قائمة افتراضية للمنتجات
static List<ProductModel> products = [
ProductModel(
title: 'Double Whopper',
price: 29.57,
image: 'assets/images/image1.png',
quantity: 0,
description: 'A classic burger with two flame-grilled beef patties, cheese, lettuce, tomato, pickles, onions, and special sauce.',
),
ProductModel(
title: 'Steakhouse XI',
price: 35.65,
image: 'assets/images/image2.png',
quantity: 0,
description: 'A hearty burger featuring a thick flame-grilled beef patty, crispy bacon, cheese, and BBQ sauce.',
),
ProductModel(
title: 'Chicken Steakhous...',
price: 37.39,
image: 'assets/images/image3.png',
quantity: 0,
description: 'Grilled chicken breast with a rich steakhouse sauce, fresh vegetables, and cheese.',
),
ProductModel(
title: 'Steakhouse',
price: 30.43,
image: 'assets/images/image4.png',
quantity: 0,
description: 'A savory burger with a flame-grilled beef patty, crispy onions, cheese, and a smoky steakhouse sauce.',
),
ProductModel(
title: 'Quattro Cheese Gril...',
price: 29.57,
image: 'assets/images/image5.png',
quantity: 0,
description: 'A delicious grilled sandwich loaded with four types of melted cheese for a rich flavor.',
),
ProductModel(
title: 'Quattro Cheese Chi...',
price: 29.57,
image: 'assets/images/image6.png',
quantity: 0,
description: 'Grilled chicken and four types of cheese, perfectly melted in a toasted bun.',
),
];
}



4-prompt: add to db bool isfavorite and string description ??  
'CREATE TABLE products (id INTEGER PRIMARY KEY, title TEXT, image TEXT, price REAL, quantity INTEGER)',


answer: