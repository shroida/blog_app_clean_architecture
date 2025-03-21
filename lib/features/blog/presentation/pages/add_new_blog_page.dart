import 'package:blog_clean_architecture/core/constant/topics_constants.dart';
import 'package:blog_clean_architecture/core/theme/app_color.dart';
import 'package:blog_clean_architecture/features/blog/presentation/widgets/app_bar_add_new.dart';
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
  List<String> selectedTopics = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAddNew(),
      body: Column(
        children: [
          const DottedBorderWidget(),
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
        ],
      ),
    );
  }
}
