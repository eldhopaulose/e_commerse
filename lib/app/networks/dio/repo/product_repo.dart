import 'package:dio/dio.dart';

import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/res/get_product_res.dart';

class ProductRepo {
  DioClient dioClient = DioClient(Dio());
  Future<GetProductRes?> getProduct(String category) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.getProductsData,
        queryParameters: category,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final getProductResponse = GetProductRes.fromJson(response.data);
          return getProductResponse;
        } else if (response.statusCode == 400) {
          final getProductResponse = GetProductRes.fromJson(response.data);
          return getProductResponse;
        } else {
          return GetProductRes(error: "Something went wrong");
        }
      } else {
        return GetProductRes(error: "Something went wrong");
      }
    } catch (e) {
      return throw Exception(GetProductRes(error: e.toString()));
    }
  }
}
