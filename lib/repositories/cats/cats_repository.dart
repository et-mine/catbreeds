import 'package:app_pragma_catbreeds/models/cats.dart';

abstract class CatsRepository {
  Future<List<CatModel>> getAllCats();
}
