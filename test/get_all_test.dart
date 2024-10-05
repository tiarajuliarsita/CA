import 'package:my_ca/features/Profile/data/datasources/remote_data_source.dart';

Future<void> main() async {
  final ProfileRemoteDataSourceImpl pr = ProfileRemoteDataSourceImpl();
  var response = await pr.getAllUsers(1);
  for (var element in response) {
    print(element.toJson());
  }
}
