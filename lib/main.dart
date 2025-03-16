import 'package:blog_clean_architecture/blog_app.dart';
import 'package:blog_clean_architecture/core/constant/constant.dart';
import 'package:blog_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_clean_architecture/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final supabase =
      await Supabase.initialize(anonKey: anonKey, url: supabaseUrl);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => AuthCubit(UserSignUp(
              AuthRepoImpl(AuthRemoteDataSourceImpl(supabase.client)))))
    ],
    child: const BlogApp(),
  ));
}
