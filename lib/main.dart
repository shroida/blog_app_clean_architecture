import 'package:blog_clean_architecture/blog_app.dart';
import 'package:blog_clean_architecture/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(anonKey: anonKey, url: supabaseUrl);
  runApp(const BlogApp());
}
