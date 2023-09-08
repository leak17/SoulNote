import 'dart:io';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/create/create_controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class JournalBox extends StatefulWidget {
  const JournalBox({Key? key}) : super(key: key);

  @override
  JournalBoxState createState() => JournalBoxState();
}

class JournalBoxState extends State<JournalBox> {
  final CreateController createController = Get.put(CreateController());
  String? selectedEmojiName;
  Map<String, Emoji> emojiMap = {};

  @override
  void initState() {
    super.initState();
    loadSelectedEmoji();
  }

  Future<void> loadSelectedEmoji() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final emojiPath = '${appDir.path}/selected_emoji.txt';

      // Read the selected emoji name from the file
      final emojiName = await File(emojiPath).readAsString();

      setState(() {
        selectedEmojiName = emojiName;
      });
    } catch (error) {
      print('Error loading emoji: $error');
    }
  }

  Future<void> saveEmojiLocally(Emoji emoji) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final emojiPath = '${appDir.path}/selected_emoji.txt';

      // Write the selected emoji name to a file
      await File(emojiPath).writeAsString(emoji.name);

      setState(() {
        selectedEmojiName = emoji.name;
        emojiMap[emoji.name] = emoji;
      });
    } catch (error) {
      print('Error saving emoji: $error');
    }
  }

  Future<void> _showImagePickerDialog(BuildContext context) async {
    final shouldUpdateImage = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Select Image Source",
            style: TextStyle(
              fontFamily: 'KantumruyPro',
              color: ThemeColor.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ButtonTheme(
                  minWidth: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop(createController.takePhoto());
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
                      Navigator.of(context)
                          .pop(createController.pickImageFromGallery());
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
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: 'KantumruyPro',
                  color: ThemeColor.mainColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (shouldUpdateImage != null && shouldUpdateImage) {
      final File? imageFile = createController.imageFile.value;
      if (imageFile != null) {
        createController.saveImageToStorage(imageFile);
      }
    }
  }

  Future<void> _showEmojiPicker(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.blueColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Positioned(
                  child: createController.imageFile.value != null &&
                          createController.imageFile.value!.existsSync()
                      ? SizedBox(
                          height: 200,
                          child: Image.file(
                            createController.imageFile.value!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.colorScheme.onSurface,
                        ),
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
                              _showImagePickerDialog(context);
                            },
                            icon: Icon(
                              Icons.photo,
                              color: ThemeColor.colorScheme.onSurface,
                              size: 24,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _showEmojiPicker(context);
                            },
                            icon: selectedEmojiName != null
                                ? Text(
                                    emojiMap[selectedEmojiName!]?.emoji ?? '',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: ThemeColor.colorScheme.onSurface,
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
                  style: TextStyle(
                    color: ThemeColor.colorScheme.onSurface,
                  ),
                  maxLines: null,
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
        ],
      ),
    );
  }
}
