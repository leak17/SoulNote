import 'dart:io';

import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/home/home_controller.dart';
import 'package:diary_journal/widget/custom_app_bar.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
        backgroundColor: const Color.fromARGB(233, 0, 0, 0),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: Get.find<HomeController>().searchFocusNode,
                        controller: Get.find<HomeController>().searchController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          EasyDateTimeLine(
            initialDate: Get.find<HomeController>().selectedDate.value,
            onDateChange: (selectedDate) {
              Get.find<HomeController>().updateSelectedDate(selectedDate);
            },
            activeColor: ThemeColor.colorScheme.primary,
            dayProps: EasyDayProps(
              todayHighlightStyle: TodayHighlightStyle.withBackground,
              todayHighlightColor: ThemeColor.mainColor,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColor.mainColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(() {
                  var controller = Get.find<HomeController>();
                  return ListView.builder(
                    itemCount: controller.notes.length,
                    itemBuilder: (context, index) {
                      final note = controller.notes[index];
                      final DateTime selectedDate =
                          controller.selectedDate.value;
                      final DateTime cardDate =
                          selectedDate.add(Duration(days: index));
                      final formattedTime =
                          DateFormat('EEE, MMM d').format(cardDate);

                      // Check if note has an imagePath
                      ImageProvider imageProvider;
                      if (note.imagePath != null &&
                          note.imagePath!.isNotEmpty) {
                        imageProvider = FileImage(File(note.imagePath!));
                      } else {
                        imageProvider =
                            const AssetImage('assets/images/default_image.jpg');
                      }

                      return Slidable(
                        actionPane: const SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: IconSlideAction(
                              caption: 'Share',
                              color: ThemeColor.colorScheme.primary,
                              icon: Icons.share,
                              onTap: () {},
                            ),
                          ),
                        ],
                        secondaryActions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: IconSlideAction(
                              caption: 'Edit',
                              color: ThemeColor.blueColor,
                              icon: Icons.edit,
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: IconSlideAction(
                              caption: 'Delete',
                              color: ThemeColor.colorScheme.error,
                              icon: Icons.delete,
                              onTap: () {},
                            ),
                          ),
                        ],
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              note.title,
                              style: TextStyle(
                                fontFamily: 'KantumruyPro',
                                color: ThemeColor.colorScheme.background,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              note.description,
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: 'KantumruyPro',
                                color: ThemeColor.colorScheme.background,
                                fontSize: 14,
                              ),
                            ),
                            trailing: const Icon(Icons.emoji_emotions),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
