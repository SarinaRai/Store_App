import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:store_app/data/app_exception.dart';
import 'package:store_app/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  static final NetworkApiServices _instance = NetworkApiServices._internal();

  factory NetworkApiServices() {
    return _instance;
  }

  NetworkApiServices._internal();

  dynamic responseJson;

  @override
  Future getApiResponse(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));
      returnResponse(response);
      responseJson = jsonDecode(response.body);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, data) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(data),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(Duration(seconds: 10));
      print("This is response ==============${response.body}");
      return await returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      try {
        dynamic responseJson = jsonDecode(response.body);
        log('Decoded Json: $responseJson');
        return responseJson;
      } catch (e) {
        log('Error decoding JSON: $e');
        throw FetchDataException('Error decoding response: ${response.body}');
      }
    case 201:
      try {
        dynamic responseJson = jsonDecode(response.body);
        log('Decoded JSON: $responseJson');
      } catch (e) {
        log("Error decoding JSON: $e");
        throw FetchDataException('Error decoding response: ${response.body}');
      }
    case 401:
      UnathorizedException(response.body.toString());
      break;
    case 400:
      throw UnathorizedException(response.body.toString());
    case 404:
      throw UnathorizedException(response.body.toString());
    case 500:
      throw UnathorizedException(response.body.toString());
    default:
      throw FetchDataException(
        'Error occurred while communicating with server ${response.statusCode}',
      );
  }
}
