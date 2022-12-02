import 'dart:developer';

import 'package:app/connection.dart/constant.dart';
import 'package:app/model/chatroommodel.dart';
import 'package:app/model/messagemodel.dart';
import 'package:app/model/usermodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Usermodel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.userapi);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Usermodel> _model = usermodelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Messagemodel>?> getmessage() async {
    try {
      var url = Uri.parse(ApiConstants.messageapi);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Messagemodel> messageModel = messagemodelFromJson(response.body);
        return messageModel;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Chatroommodel>?> getchatroom() async {
    try {
      var url = Uri.parse(ApiConstants.chatapi);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Chatroommodel> chatmodel = chatroommodelFromJson(response.body);
        return chatmodel;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
