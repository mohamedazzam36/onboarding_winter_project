import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:onboarding_winter_project/core/network/api_services.dart';
import 'package:onboarding_winter_project/core/network/dio_config.dart';
import 'package:onboarding_winter_project/core/storage/secure_storage.dart';
import 'package:onboarding_winter_project/core/storage/shared_prefs_helper.dart';
import 'package:onboarding_winter_project/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:onboarding_winter_project/features/auth/data/repository/auth_repository_impl.dart';
import 'package:onboarding_winter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/login_use_case.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/save_user_data_use_case.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/set_logged_in_use_case.dart';
import 'package:onboarding_winter_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:onboarding_winter_project/features/home/data/repos/home_repo_impl.dart';
import 'package:onboarding_winter_project/features/home/domain/repos/home_repo.dart';
import 'package:onboarding_winter_project/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:onboarding_winter_project/features/onboarding/data/data_source/local/local_onboarding_data_source.dart';
import 'package:onboarding_winter_project/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:onboarding_winter_project/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:onboarding_winter_project/features/onboarding/domain/use_cases/set_visited_before_use_case.dart';
import 'package:onboarding_winter_project/features/onboarding/presentation/onboarding_cubit/onboarding_cubit.dart';
import 'package:onboarding_winter_project/features/splash/data/data_source/local/local_data_source.dart';
import 'package:onboarding_winter_project/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:onboarding_winter_project/features/splash/domain/repositories/splash_repository.dart';
import 'package:onboarding_winter_project/core/common_use_cases/is_logged_in_use_case.dart';
import 'package:onboarding_winter_project/features/splash/domain/use_cases/is_visited_before_use_case.dart';
import 'package:onboarding_winter_project/features/splash/presentation/splash_cubit/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onboarding_winter_project/features/auth/data/data_sources/local/auth_local_data_source.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  getIt.registerLazySingleton(() => SharedPrefsHelper(sharedPreferences));
  getIt.registerLazySingleton(() => SecureStorage(secureStorage));
  getIt.registerLazySingleton(() => ApiServices(DioConfig.getDio()));
  getIt.registerFactory<IsLoggedInUseCase>(() => IsLoggedInUseCase(getIt()));

  //Auth

  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt(), getIt()),
  );
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerFactory<SetLoggedInUseCase>(() => SetLoggedInUseCase(getIt()));
  getIt.registerFactory<SaveUserDataUseCase>(
    () => SaveUserDataUseCase(getIt()),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt(), getIt(), getIt()));

  //splash
  getIt.registerSingleton<LocalDataSource>(LocalDataSource(getIt()));
  getIt.registerSingleton<SplashRepository>(SplashRepositoryImpl(getIt()));
  getIt.registerFactory(() => IsVisitedBeforeUseCase(getIt()));
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt(), getIt()));

  //onboarding
  getIt.registerFactory<SetVisitedBeforeUseCase>(
    () => SetVisitedBeforeUseCase(getIt()),
  );
  getIt.registerLazySingleton<LocalOnboardingDataSource>(
    () => LocalOnboardingDataSource(getIt()),
  );
  getIt.registerFactory<OnboardingRepository>(
    () => OnboardingRepositoryImpl(getIt()),
  );
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt(), getIt()),
  );

  //home
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));
  getIt.registerFactory<HomeRepo>(() => HomeRepoImpl(apiService: getIt()));
}
