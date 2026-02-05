import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/home/domain/entities/categories_entity.dart';
import 'package:onboarding_winter_project/features/home/domain/repos/home_repo.dart';

class FetchCategoriesUseCase {
  final HomeRepo homeRepo;

  FetchCategoriesUseCase({required this.homeRepo});

  Future<ApiResult<List<CategoriesEntity>>> call() async {
    final result = await homeRepo.getCategories();
    if (result is Success) {
      return Success((result as Success).data);
    } else {
      Failure failure = result as Failure;
      return Failure(failure.exception);
    }
  }
}
