part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class ProductsInitial extends CategoriesState {}

final class ProductsLoading extends CategoriesState {}

final class ProductsSuccess extends CategoriesState {
  final List<CategoriesEntity> categories;

  ProductsSuccess(this.categories);
}

final class ProductsFailure extends CategoriesState {
  final String errorMessage;

  ProductsFailure(this.errorMessage);
}
