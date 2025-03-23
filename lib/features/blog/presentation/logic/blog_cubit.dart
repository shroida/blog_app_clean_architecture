import 'dart:io';
import 'package:blog_clean_architecture/features/blog/domain/usecase/upload_blog.dart';
import 'package:blog_clean_architecture/features/blog/presentation/logic/blog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogCubit extends Cubit<BlogState> {
  final UploadBlog uploadBlog;
  BlogCubit(this.uploadBlog) : super(BlogInitial());
  void _onUploadBlog({
    required String posterId,
    required String title,
    required String content,
    required File image,
    required List<String> topics,
  }) async {
    emit(BlogLoading());
    final res = await uploadBlog.call(
      UploadBlogParams(
        posterId: posterId,
        title: title,
        content: content,
        image: image,
        topics: topics,
      ),
    );
    res.fold(
      (failure) => emit(BlogFailure(error: failure.toString())),
      (blog) => emit(BlogSuccess(blog)),
    );
  }
}
