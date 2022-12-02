import 'dart:developer';

import 'package:app/connection.dart/constant.dart';
import 'package:app/infosample/Model_user.dart';
import 'package:http/http.dart' as http;


class ApiService {
  Future<List<Usermodel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Usermodel> _model = usermodelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
