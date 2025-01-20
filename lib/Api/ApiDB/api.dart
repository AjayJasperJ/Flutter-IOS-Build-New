import 'dart:convert';

import 'package:cubit_zero_to_pro/Api/product_data_model/product_data_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> listdata() async {
    final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    jsonDecode(response.body)['categories'];
    return jsonDecode(response.body)['categories'];
  }
}

List<ProductDataModel> favoriteitems = [];
List<ProductDataModel> cartitems = [];
