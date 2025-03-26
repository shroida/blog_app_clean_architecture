import 'dart:io';

import 'package:blog_clean_architecture/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:blog_clean_architecture/core/common/widgets/loader.dart';
import 'package:blog_clean_architecture/core/constant/topics_constants.dart';
import 'package:blog_clean_architecture/core/theme/app_color.dart';
import 'package:blog_clean_architecture/core/utlis/pick_image.dart';
import 'package:blog_clean_architecture/core/utlis/snackbar.dart';
import 'package:blog_clean_architecture/features/blog/presentation/logic/blog_cubit.dart';
import 'package:blog_clean_architecture/features/blog/presentation/logic/blog_state.dart';
import 'package:blog_clean_architecture/features/blog/presentation/pages/blog_page.dart';
import 'package:blog_clean_architecture/features/blog/presentation/widgets/blog_editor.dart';
import 'package:blog_clean_architecture/features/blog/presentation/widgets/dotted_border_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewBlogPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        final appUserState = context.read<AppUserCubit>().state;
        if (appUserState is! AppUserLoggedIn) {
          // Redirect to login or show error
          return const Scaffold(
            body: Center(child: Text('Please log in to create a blog')),
          );
        }
        return const AddNewBlogPage();
      },
    );
  }

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

  void uploadBlog() async {
    if (formKey.currentState!.validate() && selectedTopics.isNotEmpty) {
      if (image == null) {
        showSnackBar(context, 'Please select an image');
        return;
      }

      final appUserState = context.read<AppUserCubit>().state;
      if (appUserState is! AppUserLoggedIn) {
        showSnackBar(context, 'You need to be logged in to upload a blog');
        return;
      }

      await context.read<BlogCubit>().onUploadBlog(
            posterId: appUserState.user.id,
            title: titleController.text,
            content: contentController.text,
            image: image!,
            topics: selectedTopics,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: uploadBlog,
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: BlocConsumer<BlogCubit, BlogState>(
        // In the BlocConsumer listener
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackBar(context, state.error, isError: true);
          } else if (state is BlogUploadSuccess) {
            showSnackBar(context, 'Blog published successfully!');
            Navigator.pushAndRemoveUntil(
              context,
              BlogPage.route(),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Loader();
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
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
                                    child:
                                        Image.file(image!, fit: BoxFit.fill))),
                          )
                        : GestureDetector(
                            onTap: selectImage,
                            child: const DottedBorderWidget()),
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
        },
      ),
    );
  }
}
