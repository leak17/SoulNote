import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/create/create_controller.dart';
import 'package:diary_journal/views/create/local_widget/journal_box.dart';
import 'package:diary_journal/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateController createController = Get.put(CreateController());

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
        backgroundColor: ThemeColor.transparentColor,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Column(
          children: [
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: createController.decrementMonth,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: ThemeColor.mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.chevron_left,
                          color: ThemeColor.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: ThemeColor.mainColor,
                      ),
                      child: Text(
                        DateFormat.yMMMd().format(createController.date.value),
                        style: TextStyle(
                          color: ThemeColor.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: createController.incrementMonth,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: ThemeColor.mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.chevron_right,
                          color: ThemeColor.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor.mainColor,
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: ThemeColor.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: JournalBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
