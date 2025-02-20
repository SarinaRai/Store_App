import 'dart:developer';
import 'package:store_app/data/network/base_api_services.dart';
import 'package:store_app/data/network/network_api_services.dart';
import 'package:store_app/model/product._model.dart';
import 'package:store_app/res/api_url.dart';

class ProductRepository {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> getProductData() async {
    try {
      final response = await apiServices.getApiResponse(ApiUrl.productUrl);

      return List<ProductListModel>.from(
        (response as List).map((x) => ProductListModel.fromJson(x)),
      );
    } catch (e) {
      print(
        "This is Prodeuct repo ERROR =================================${e.toString()}",
      );
    }
  }
}
