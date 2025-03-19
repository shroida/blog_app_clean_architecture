import 'package:blog_clean_architecture/blog_app.dart';
import 'package:blog_clean_architecture/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:blog_clean_architecture/core/di/dependency_injection.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpGetIt();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => getIt<AppUserCubit>()),
      BlocProvider(create: (_) => getIt<AuthCubit>())
    ],
    child: const BlogApp(),
  ));
}
