import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/core/network/api_services.dart';
import 'package:onboarding_winter_project/features/home/domain/entities/categories_entity.dart';
import 'package:onboarding_winter_project/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<ApiResult<List<CategoriesEntity>>> getCategories() async {
    final result = await apiService.getCategories();
    if (result is Success) {
      return Success((result as Success).data);
    } else {
      return Failure((result as Failure).exception);
    }
  }
}
