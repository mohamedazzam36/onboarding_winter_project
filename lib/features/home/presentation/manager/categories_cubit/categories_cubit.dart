import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/home/domain/entities/categories_entity.dart';
import 'package:onboarding_winter_project/features/home/domain/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(ProductsInitial());

  final HomeRepo homeRepo;

  Future<void> getCategories() async {
    emit(ProductsLoading());
    final result = await homeRepo.getCategories();
    if (result is Success) {
      emit(ProductsSuccess((result as Success).data));
    } else {
      emit(
        ProductsFailure((result as Failure).exception.errorMessage ?? 'An unknown error occurred'),
      );
    }
  }
}
