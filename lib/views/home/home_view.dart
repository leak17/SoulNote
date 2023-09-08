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
              activeColor: const Color(0xff85A389),
              dayProps: const EasyDayProps(
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                todayHighlightColor: Color.fromARGB(255, 69, 84, 172),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: (MediaQuery.of(context).size.height),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 86, 143, 170),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0))),
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
                        SizedBox(
                          height:
                              70.0, // You can adjust this to the height you desire.
                          child: IconSlideAction(
                            caption: 'Share',
                            color: const Color(0xFF8B9299),
                            icon: Icons.share,
                            onTap: () {
                              // share action
                            },
                          ),
                        ),
                      ],
                      secondaryActions: [
                        SizedBox(
                          height:
                              70.0, // Adjust this to match the height of the card.
                          child: IconSlideAction(
                            caption: 'Edit',
                            color: Colors.blue,
                            icon: Icons.edit,
                            onTap: () {
                              // edit action
                            },
                          ),
                        ),
                        SizedBox(
                          height:
                              70.0, // Adjust this to match the height of the card.
                          child: IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              // delete action
                            },
                          ),
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
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(
                              formattedTime,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          title: const Text('Koh Kong Trip'),
                          subtitle: const Text(
                            'Notice your mood and track output everyday. Find your strength and weakness to improve to gain more...',
                            maxLines: 3,
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
