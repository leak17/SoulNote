import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/mood/local_widget/feeling_mood.dart';
import 'package:diary_journal/views/mood/local_widget/feeling_mood_count.dart';
import 'package:get/get.dart';

class MoodController extends GetxController {
  RxList<FeelingData> feelings = <FeelingData>[].obs;
  RxList<FeelingMoodCount> feelingCount = <FeelingMoodCount>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize your data here or fetch it from an API
    feelings.addAll([
      FeelingData(label: 'Awesome', color: ThemeColor.awesomeColor, value: 30),
      FeelingData(label: 'Happy', color: ThemeColor.happyColor, value: 20),
      FeelingData(label: 'Neutral', color: ThemeColor.nautralColor, value: 15),
      FeelingData(label: 'Bad', color: ThemeColor.badColor, value: 10),
      FeelingData(label: 'Awful', color: ThemeColor.awfulColor, value: 5),
    ]);

    feelingCount.addAll([
      FeelingMoodCount(label: '30%', color: ThemeColor.awesomeColor, value: 30),
      FeelingMoodCount(label: '20%', color: ThemeColor.happyColor, value: 20),
      FeelingMoodCount(label: '15%', color: ThemeColor.nautralColor, value: 15),
      FeelingMoodCount(label: '10%', color: ThemeColor.badColor, value: 10),
      FeelingMoodCount(label: '5%', color: ThemeColor.awfulColor, value: 5),
    ]);
  }
}
