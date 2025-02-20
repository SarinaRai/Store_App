import 'package:store_app/data/network/base_api_services.dart';
import 'package:store_app/data/network/network_api_services.dart';
import 'package:store_app/res/api_url.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      final response = await apiServices.postApiResponse(ApiUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
