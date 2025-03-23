import 'package:blog_clean_architecture/features/blog/data/models/blog_model.dart';
import 'package:hive/hive.dart';

abstract interface class BlogLocalDataSource {
  void uploadLocalBlogs({required List<BlogModel> blogs});
  List<BlogModel> loadBlogs();
}

class BlogLocalDataSourceImpl implements BlogLocalDataSource {
  final Box box;
  BlogLocalDataSourceImpl(this.box);

  @override
  List<BlogModel> loadBlogs() {
    List<BlogModel> blogs = [];
    for (int i = 0; i < box.length; i++) {
      final blogJson = box.get(i.toString()); // استرجاع البيانات باستخدام `get`
      if (blogJson != null) {
        blogs.add(BlogModel.fromJson(blogJson));
      }
    }
    return blogs;
  }

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear(); // مسح البيانات القديمة

    for (int i = 0; i < blogs.length; i++) {
      box.put(i.toString(), blogs[i].toJson()); // إضافة البيانات باستخدام `put`
    }
  }
}
