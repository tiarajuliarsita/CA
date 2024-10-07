import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import 'package:my_ca/core/error.dart';
import 'package:my_ca/features/Profile/data/datasources/local_data_source.dart';
import 'package:my_ca/features/Profile/data/datasources/remote_data_source.dart';

import 'package:my_ca/features/Profile/domain/entities/profile.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/profile_repository.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;
  final HiveInterface hive;

  ProfileRepositoryImpl(this.hive,
      {required this.profileRemoteDataSource,
      required this.profileLocalDataSource});

  @override
  Future<Either<Failure, List<Profile>>> getAllUsers(int page) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<ProfileModel> hasil =
            await profileLocalDataSource.getAllUsers(page);
        return right(hasil);
      } else {
        List<ProfileModel> hasil =
            await profileRemoteDataSource.getAllUsers(page);
        var box = hive.box("profile_box");
        box.put("getAllUser", hasil);
        return right(hasil);
      }
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, Profile>> getUser(int id) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        ProfileModel hasil = await profileLocalDataSource.getUser(id);
        return right(hasil);
      } else {
        ProfileModel hasil = await profileRemoteDataSource.getUser(id);
        var box = hive.box("profile_box");
        box.put("getUser", hasil);
        return right(hasil);
      }
    } catch (e) {
      return left(Failure());
    }
  }
}
