import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchModel>>> getSearch(
      {required String search});
}
