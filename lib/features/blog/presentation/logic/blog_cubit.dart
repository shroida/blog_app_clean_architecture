import 'package:blog_clean_architecture/features/blog/presentation/logic/blog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());
}
