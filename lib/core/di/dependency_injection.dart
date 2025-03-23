import 'package:blog_clean_architecture/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:blog_clean_architecture/core/constant/constant.dart';
import 'package:blog_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_clean_architecture/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repo.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/current_user.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/user_login.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_cubit.dart';
import 'package:blog_clean_architecture/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:blog_clean_architecture/features/blog/data/repositoires/blog_repo_impl.dart';
import 'package:blog_clean_architecture/features/blog/domain/repositories/blog_repository.dart';
import 'package:blog_clean_architecture/features/blog/domain/usecase/upload_blog.dart';
import 'package:blog_clean_architecture/features/blog/presentation/logic/blog_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  _initAuth();
  _initBlog();
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
  getIt.registerFactory(() => CurrentUser(getIt()));
  getIt.registerFactory(() => AppUserCubit());
  getIt.registerLazySingleton(
      () => AuthCubit(getIt(), getIt(), getIt(), getIt()));
}

void _initBlog() {
  getIt.registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(getIt()));
  getIt.registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => UploadBlog(getIt()));
  getIt.registerFactory(() => AppUserCubit());
  getIt.registerLazySingleton(() => BlogCubit(
        getIt(),
      ));
}
