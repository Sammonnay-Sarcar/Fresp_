import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fresp/constants/error_handling.dart';
import 'package:fresp/constants/global_variables.dart';
import 'package:fresp/constants/utils.dart';
import 'package:fresp/models/product.dart';
import 'package:fresp/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductService {
  Future<List<Product>> getProducts(
      BuildContext context, String category) async {
    List<Product> productList = [];
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response ProductRes = await http.get(
        Uri.parse('$uri/api/v1/product/getProduct?category=$category'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token
        },
      );
      httpErrorHandle(
          response: ProductRes,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(ProductRes.body).length; i++) {
              productList.add(
                  Product.fromJson(jsonEncode(jsonDecode(ProductRes.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, "Products not found");
    }
    return productList;
  }
}
