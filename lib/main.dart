import 'package:blog_clean_architecture/blog_app.dart';
import 'package:blog_clean_architecture/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:blog_clean_architecture/core/di/dependency_injection.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_cubit.dart';
import 'package:blog_clean_architecture/features/blog/presentation/logic/blog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpGetIt();

  // Initialize user state if already logged in
  final appUserCubit = getIt<AppUserCubit>();
  await appUserCubit.isUserLoggedIn(); // Add this method to your AppUserCubit

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => appUserCubit),
      BlocProvider(create: (_) => getIt<AuthCubit>()),
      BlocProvider(create: (context) => getIt<BlogCubit>())
    ],
    child: const BlogApp(),
  ));
}
