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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: Get.find<HomeController>().searchFocusNode,
                        controller: Get.find<HomeController>().searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
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
            Container(
              height: (MediaQuery.of(context).size.height),
              decoration: BoxDecoration(
                color: ThemeColor.mainColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final DateTime selectedDate =
                        Get.find<HomeController>().selectedDate.value;
                    final DateTime cardDate =
                        selectedDate.add(Duration(days: index));

                    final formattedTime =
                        DateFormat('EEE, MMM d').format(cardDate);

                    return Slidable(
                      actionPane: const SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: [
                        IconSlideAction(
                          caption: 'Share',
                          color: ThemeColor.colorScheme.primary,
                          icon: Icons.share,
                          onTap: () {},
                        ),
                      ],
                      secondaryActions: [
                        IconSlideAction(
                          caption: 'Edit',
                          color: ThemeColor.blueColor,
                          icon: Icons.edit,
                          onTap: () {},
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: ThemeColor.colorScheme.error,
                          icon: Icons.delete,
                          onTap: () {},
                        ),
                      ],
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ThemeColor.colorScheme.primary),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(
                              formattedTime,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          title: Text(
                            'Koh Kong Trip',
                            style: TextStyle(
                              fontFamily: 'KantumruyPro',
                              color: ThemeColor.colorScheme.background,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Notice your mood and track output everyday. Find your strength and weakness to improve to gain more...',
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
