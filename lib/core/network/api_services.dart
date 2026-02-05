import 'package:dio/dio.dart';
import 'package:onboarding_winter_project/core/network/api_constants.dart';
import 'package:onboarding_winter_project/core/network/api_exception.dart';
import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/core/network/dio_config.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_request_model.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_response.dart';
import 'package:onboarding_winter_project/features/home/domain/entities/categories_entity.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  Future<ApiResult<LoginResponse>> login(LoginRequestModel request) async {
    try {
      Response response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(LoginResponse.fromJson(response.data));
      } else {
        return Failure(
          ApiException(errorMessage: response.statusMessage ?? response.data),
        );
      }
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    } catch (e) {
      return Failure(ApiException(errorMessage: e.toString()));
    }
  }

  Future<ApiResult<List<CategoriesEntity>>> getCategories() async {
    try {
      Response response = await _dio.get(ApiConstants.categoriesEndPoint);
      if (response.statusCode == 200) {
        final categories = (response.data as List)
            .map(
              (e) => CategoriesEntity(
                title: e,
                imageUrl:
                    'https://media.istockphoto.com/id/887360960/photo/mens-suits-on-hangers-in-different-colors.jpg?s=612x612&w=0&k=20&c=RR19yJjRuR-CBWj9u1sQkFgtdYJ07KEkM678R0mtuZY=',
              ),
            )
            .toList();

        return Success(categories);
      } else {
        return Failure(
          ApiException(errorMessage: response.statusMessage ?? response.data),
        );
      }
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    } catch (e) {
      return Failure(ApiException(errorMessage: e.toString()));
    }
  }
}
