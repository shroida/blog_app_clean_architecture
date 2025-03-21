import 'package:blog_clean_architecture/core/theme/app_color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AddNewBlogPage(),
      );
  const AddNewBlogPage({super.key});

  @override
  AddNewBlogPageState createState() => AddNewBlogPageState();
}

class AddNewBlogPageState extends State<AddNewBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // uploadBlog();
            },
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          DottedBorder(
            color: AppColor.borderColor,
            dashPattern: const [10, 4],
            radius: const Radius.circular(10),
            borderType: BorderType.RRect,
            strokeCap: StrokeCap.round,
            child: const SizedBox(
              height: 150,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder_open,
                    size: 40,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Select your image',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
