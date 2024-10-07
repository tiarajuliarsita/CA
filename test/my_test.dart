import 'package:my_ca/features/Profile/data/datasources/remote_data_source.dart';

Future<void> main() async {
  final ProfileRemoteDataSourceImpl pr = ProfileRemoteDataSourceImpl();

  try {
    var response = await pr.getUser(1);
    print(response.toJson());
  } catch (e) {
    print(e);
  }
}
