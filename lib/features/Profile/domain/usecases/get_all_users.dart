import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetAllUsers {
  final ProfileRepository profileRepo;

  GetAllUsers(this.profileRepo);
 Future<Either<Failure, List<Profile>>> execute(int page) async {
    return await profileRepo.getAllUsers(page);
  }
}
