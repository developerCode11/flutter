import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiMethodType {
  static const String post = "POST";
  static const String patch = "PATCH";
  static const String get = "GET";
  static const String put = "PUT";
  static const String delete = "DELETE";
}

class ApiService {
  static Future getRequest(
    String endpoint, {
    Map<String, dynamic>? query,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.get, params: query);
  }

  static Future postRequest(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.post, params: body);
  }

  static Future putRequest(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.put, params: body);
  }

  static Future deleteRequest(
    String endpoint, {
    Map<String, dynamic>? query,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.delete, params: query);
  }
}

class ApiServiceMethods extends GetConnect {
  Future getRequest(String endpoint, {Map<String, dynamic>? query}) async {
    return await makeApiCall(endpoint, ApiMethodType.get, params: query);
  }

  Future postRequest(String endpoint, {Map<String, dynamic>? body}) async {
    return await makeApiCall(endpoint, ApiMethodType.post, params: body);
  }

  Future putRequest(String endpoint, {Map<String, dynamic>? body}) async {
    return await makeApiCall(endpoint, ApiMethodType.put, params: body);
  }

  Future deleteRequest(String endpoint, {Map<String, dynamic>? query}) async {
    return await makeApiCall(endpoint, ApiMethodType.delete, params: query);
  }

  Future makeApiCall(
    String baseUrl,
    String method, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    //For charles proxy
    Response? response;
    String proxy = '192.168.29.142:8888';
    HttpClient httpClient = HttpClient();
    httpClient.findProxy = (uri) {
      return "PROXY $proxy;";
    };

    // HEADER
    Map<String, String> commonHeader = <String, String>{};

    if ((GetStorage().read("userDetails")?['accessToken'] ?? "").isNotEmpty) {
      commonHeader['Authorization'] =
          (GetStorage().read("userDetails")['accessToken']);
      commonHeader['Content-Type'] = "application/json";
      commonHeader['Accept'] = "application/json";
    }

    if (method == ApiMethodType.post) {
      response = await post(
        baseUrl,
        params,
        headers: commonHeader,
      );
    } else if (method == ApiMethodType.get) {
      response = await get(
        baseUrl, headers: commonHeader,
        // query: params,
      );
    } else if (method == ApiMethodType.put) {
      response = await put(
        baseUrl,
        params,
        headers: commonHeader,
      );
    } else if (method == ApiMethodType.delete) {
      response = await delete(
        baseUrl,
        query: params,
        headers: commonHeader,
      );
    }
    var decodedResponse = jsonDecode(response!.body);
    int statuscode = decodedResponse['code'];
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        statuscode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 403 || statuscode == 403) {
      GetStorage().erase();
      // Get.offAllNamed(Routes.signIn);
    } else {
      throw decodedResponse['message'];
    }
  }
}
