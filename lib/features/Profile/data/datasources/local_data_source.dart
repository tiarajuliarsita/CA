import 'package:hive/hive.dart';

import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<List<ProfileModel>> getAllUsers(int page);
  Future<ProfileModel> getUser(int id);
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  final HiveInterface hive;

  ProfileLocalDataSourceImpl({required this.hive});

  @override
  Future<List<ProfileModel>> getAllUsers(int page) async {
    var box = hive.box('profile_box');
    return box.get("getAllusers");
  }

  @override
  Future<ProfileModel> getUser(int id) async {
    var box = hive.box('profile_box');
    return box.get("getUser");
  }
}
