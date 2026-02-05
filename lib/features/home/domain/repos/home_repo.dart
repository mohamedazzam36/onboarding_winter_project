import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/home/domain/entities/categories_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<List<CategoriesEntity>>> getCategories();
}
