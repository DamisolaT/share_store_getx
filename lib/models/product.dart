import 'package:flutter/rendering.dart';

class ProductModel{
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int reviewCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.reviewCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic>
  data) => ProductModel(
    id: data['id'], 
    title: data['title'], 
    price: data['price'], 
    description: data['description'], 
    category: data['category'], 
    image: data['image'],
    rating: data['rating'] ['rate'],
    reviewCount: data ['rating']['count']
    );

    Map<String, dynamic> toJson() =>{
      'id':id,
      'title':title,
      'description':description

      // any other neccessary field can follow
      
    };
}