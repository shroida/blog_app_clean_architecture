import 'dart:io';

import 'package:blog_clean_architecture/core/constant/topics_constants.dart';
import 'package:blog_clean_architecture/core/theme/app_color.dart';
import 'package:blog_clean_architecture/core/utlis/pick_image.dart';
import 'package:blog_clean_architecture/features/blog/presentation/widgets/app_bar_add_new.dart';
import 'package:blog_clean_architecture/features/blog/presentation/widgets/blog_editor.dart';
import 'package:blog_clean_architecture/features/blog/presentation/widgets/dotted_border_widget.dart';
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
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? image;
  List<String> selectedTopics = [];
  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAddNew(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              image != null
                  ? GestureDetector(
                      onTap: selectImage,
                      child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(image!, fit: BoxFit.fill))),
                    )
                  : GestureDetector(
                      onTap: selectImage, child: const DottedBorderWidget()),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TopicsConstants.topics
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              if (selectedTopics.contains(e)) {
                                selectedTopics.remove(e);
                              } else {
                                selectedTopics.add(e);
                              }
                              setState(() {});
                            },
                            child: Chip(
                              label: Text(e),
                              color: selectedTopics.contains(e)
                                  ? const WidgetStatePropertyAll(
                                      AppColor.gradient1,
                                    )
                                  : null,
                              side: selectedTopics.contains(e)
                                  ? null
                                  : const BorderSide(
                                      color: AppColor.borderColor,
                                    ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
              BlogEditor(
                controller: titleController,
                hintText: 'Blog title',
              ),
              const SizedBox(height: 10),
              BlogEditor(
                controller: contentController,
                hintText: 'Blog content',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
