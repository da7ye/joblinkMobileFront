import 'dart:convert';
import 'package:flutter_application_1/config.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static var client = http.Client();

  static Future<dynamic> getCategories() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('${Config.appUrl}/${Config.categoriesEndpoint}');

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }

    return null;
  }
  
  static Future<dynamic> getCategoryProvider(int categoryId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('${Config.appUrl}/categoryProvider/$categoryId/');

    var response = await client.get(url, headers: requestHeaders);
    

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }

    return null;
  }

  static Future<dynamic> getProviders() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('${Config.appUrl}/${Config.providersEndpoint}');

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }

    return null;
  }
  

  

  static Future<dynamic> getUsers() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('${Config.appUrl}/${Config.usersEndpoint}');

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }

    return null;
  }
}
