import 'package:store_app/models/reting_model.dart';

class ProductModel{

  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final RatingModel? ratingModel;

  ProductModel( {required this.ratingModel,required this.id, required this.title, required this.description, required this.image});


  factory ProductModel.fromJson(json){
    return ProductModel(id: json['id'], title: json['title'], description: json['description'], image: json['image'],ratingModel: RatingModel.froJson(json['rating']));
  }

}