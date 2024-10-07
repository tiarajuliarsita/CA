import 'dart:convert';

import 'package:my_ca/core/error/exception.dart';

import '../models/profile_model.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSource {
  Future<List<ProfileModel>> getAllUsers(int page);
  Future<ProfileModel> getUser(int id);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  @override
  Future<List<ProfileModel>> getAllUsers(int page) async {
    Uri url = Uri.parse('https://reqres.in/api/users?page=$page');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      List<dynamic> data = dataBody['data'];
      return ProfileModel.fromJsonList(data);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: 'user not fount');
    } else {
      throw GeneralException(message: 'can`t get data');
    }
  }

  @override
  Future<ProfileModel> getUser(int id) async {
    Uri url = Uri.parse('https://reqres.in/api/users/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      Map<String, dynamic> data = dataBody['data'];
      return ProfileModel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw EmptyException(message: 'user not fount');
    } else {
      throw GeneralException(message: 'can`t get data');
    }
  }
}
