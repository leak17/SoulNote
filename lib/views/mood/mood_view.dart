import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/mood/mood_controller.dart';
import 'package:diary_journal/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class MoodView extends StatelessWidget {
  MoodView({super.key});
  final MoodController controller = Get.put(MoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: CustomAppBar(),
        backgroundColor: ThemeColor.transparentColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(),
              const SizedBox(height: 16),
              Obx(() => buildMoodIcons(context)),
              const SizedBox(height: 32),
              buildPieChart(),
            ],
          ),
        ),
      ),
      backgroundColor: ThemeColor.transparentColor,
    );
  }

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ThemeColor.colorScheme.onSurface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Feeling Tracking',
        style: TextStyle(
          fontFamily: 'KantumruyPro',
          color: ThemeColor.mainColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildMoodIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: controller.feelings.map((feeling) {
        return buildMoodIcon(
            context, feeling.label, feeling.color, feeling.value.toDouble());
      }).toList(),
    );
  }

  Widget buildMoodIcon(
      BuildContext context, String label, Color color, double value) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: IconButton(
            icon: Icon(
              Icons.sentiment_very_satisfied,
              color: ThemeColor.colorScheme.onSurface,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'KantumruyPro',
            color: ThemeColor.mainColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildPieChart() {
    return AspectRatio(
      aspectRatio: 1.2,
      child: PieChart(
        PieChartData(
          sections: controller.feelingCount.map((feeling) {
            return PieChartSectionData(
              color: feeling.color,
              value: feeling.value.toDouble(),
              title: feeling.label,
              radius: 60,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'KantumruyPro',
                color: ThemeColor.colorScheme.onSurface,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
