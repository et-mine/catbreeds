import 'package:app_pragma_catbreeds/utils/utils.dart';
import 'package:dio/dio.dart' show Dio, Headers, Options;
import 'package:app_pragma_catbreeds/models/cats.dart';
import 'package:app_pragma_catbreeds/repositories/cats/cats_repository.dart';

class CatsRepositoryImpl extends CatsRepository {
  @override
  Future<List<CatModel>> getAllCats() async {
    var resp = await Dio().get('${UtilConstants.apiBaseUrl}/breeds',
        options: Options(headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json',
          'Authorization': 'Bearer ${UtilConstants.apiKey}'
        }));

    if (resp.statusCode != 200) {
      throw Exception(resp.statusMessage);
    }
    return ((resp.data) as List).map((e) => CatModel.fromJson(e)).toList();
  }
}
