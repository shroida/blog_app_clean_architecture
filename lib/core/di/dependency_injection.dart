import 'package:blog_clean_architecture/core/constant/constant.dart';
import 'package:blog_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_clean_architecture/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repo.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/user_login.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  _initAuth();
  final supabase =
      await Supabase.initialize(anonKey: anonKey, url: supabaseUrl);
  getIt.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  getIt.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()));
  getIt.registerFactory<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerFactory(() => UserSignUp(getIt()));
  getIt.registerFactory(() => UserLogin(getIt()));
  getIt.registerLazySingleton(() => AuthCubit(getIt(), getIt()));
}
