import 'dart:io';

import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/create/create_controller.dart';
import 'package:diary_journal/views/home/note_model/note_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:diary_journal/views/home/details_screen/details_controller.dart';

class DetailsView extends StatelessWidget {
  final Note note;
  final int noteIndex;

  DetailsView({
    Key? key,
    required this.note,
    required this.noteIndex,
  }) : super(key: key);
  final CreateController createController = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    final DetailsController detailsController =
        Get.put(DetailsController(noteIndex: noteIndex));
    String? selectedEmojiName;
    Map<String, Emoji> emojiMap = {};

    void saveEmojiLocally(Emoji emoji) async {
      try {
        final appDir = await getApplicationDocumentsDirectory();
        final emojiPath = '${appDir.path}/selected_emoji.txt';

        // Write the selected emoji name to a file
        await File(emojiPath).writeAsString(emoji.name);

        selectedEmojiName = emoji.name;
        emojiMap[emoji.name] = emoji;
      } catch (error) {
        print('Error saving emoji: $error');
      }
    }

    Future<void> showImagePickerDialog(BuildContext context) async {
      final shouldUpdateImage = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Select Image Source",
              style: TextStyle(
                fontFamily: 'KantumruyPro',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ThemeColor.mainColor,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop(true);
                        await createController.takePhoto();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor.colorScheme.onSurface,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: ThemeColor.blueColor,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Take a picture",
                            style: TextStyle(
                              fontFamily: 'KantumruyPro',
                              fontSize: 14,
                              color: ThemeColor.blueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop(true);
                        await createController.pickImageFromGallery();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor.colorScheme.onSurface,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Icon(
                            Icons.photo,
                            size: 20,
                            color: ThemeColor.blueColor,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Choose from gallery",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'KantumruyPro',
                              color: ThemeColor.blueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        },
      );

      if (shouldUpdateImage != null && shouldUpdateImage) {
        final File? imageFile = createController.imageFile.value;
        if (imageFile != null) {
          await createController.saveImageToStorage(imageFile);
        }
      }
    }

    Future<void> showEmojiPicker(BuildContext context) async {
      final emoji = await showModalBottomSheet<Emoji>(
        context: context,
        builder: (BuildContext context) {
          return EmojiPicker(
            onEmojiSelected: (Category? category, Emoji? emoji) {
              if (emoji != null) {
                saveEmojiLocally(emoji);
                Navigator.of(context).pop();
              }
            },
            config: const Config(
              columns: 7,
            ),
          );
        },
      );

      if (emoji != null) {
        print("Selected Emoji: ${emoji.emoji}");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.mainColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text('Edit Journal Entry'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                ElevatedButton(
                  onPressed: () {
                    detailsController.saveJournalEntry();
                    Get.back();
                  },
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
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColor.blueColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return createController.imageFile.value != null &&
                              createController.imageFile.value!.existsSync()
                          ? SizedBox(
                              height: 200,
                              child: Image.file(
                                createController.imageFile.value!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container();
                    }),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: detailsController.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.colorScheme.onSurface,
                            ),
                            onChanged: (value) =>
                                createController.setTitle(value),
                            decoration: InputDecoration(
                              hintText: 'What is your title?',
                              hintStyle: TextStyle(
                                color: ThemeColor.colorScheme.onSurface,
                                fontFamily: 'KantumruyPro',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showImagePickerDialog(context);
                                },
                                icon: Icon(
                                  Icons.photo,
                                  color: ThemeColor.colorScheme.onSurface,
                                  size: 24,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showEmojiPicker(context);
                                },
                                icon: selectedEmojiName != null
                                    ? Text(
                                        emojiMap[selectedEmojiName!]?.emoji ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color:
                                              ThemeColor.colorScheme.onSurface,
                                        ),
                                      )
                                    : Icon(
                                        Icons.emoji_emotions,
                                        color: ThemeColor.colorScheme.onSurface,
                                        size: 24,
                                      ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: ThemeColor.colorScheme.onSurface,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    TextField(
                      controller: detailsController.description,
                      style: TextStyle(
                        color: ThemeColor.colorScheme.onSurface,
                      ),
                      maxLines: null,
                      onChanged: (value) =>
                          createController.setDescription(value),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "What's on your mind?",
                        hintStyle: TextStyle(
                          fontFamily: 'KantumruyPro',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ThemeColor.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Your JournalBox Widget (Kept at the bottom)
        ],
      ),
    );
  }
}
