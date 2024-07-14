
import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';
import 'package:http/http.dart'as http;
class AddProduct{


  Future<ProductModel> addproduct(
  {
    required String title,
    required String des,
    required String price,
    required String image,
    required String category
}
      )async{
 Map<String,dynamic> response = await  Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': des,
      'image': image,
      'category': category
    });
 return ProductModel.fromJson(response);
  }
}