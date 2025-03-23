import 'package:blog_clean_architecture/features/blog/domain/entities/blog.dart';

sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogFailure extends BlogState {
  final String error;

  BlogFailure({required this.error});
}

final class BlogSuccess extends BlogState {
  final Blog blog;

  BlogSuccess(this.blog);
}
