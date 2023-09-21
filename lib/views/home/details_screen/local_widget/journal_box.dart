// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

// import '../../../../theme/theme_color.dart';
// import '../details_controller.dart';

// class Mood {
//   final String iconPath;
//   final String name;
//   final double size;
//   final Color color;

//   Mood({
//     required this.iconPath,
//     required this.name,
//     required this.size,
//     required this.color,
//   });
// }

// class JournalBox extends StatefulWidget {
  
//   const JournalBox({Key? key}) : super(key: key);

//   @override
//   _JournalBoxState createState() => _JournalBoxState();
// }

// class _JournalBoxState extends State<JournalBox> {
//   final detailsController = Get.find<DetailsController>();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();

//   String? selectedEmojiName;
//   Map<String, Emoji> emojiMap = {};

//   // Define a Mood variable to store the selected mood.
//   Mood? selectedMood;

//   // Define the moods list with Mood objects.
//   List<Mood> moods = [
//     Mood(
//       iconPath: 'assets/images/Awsome.png',
//       name: 'Awsome',
//       size: 24,
//       color: ThemeColor.successColor,
//     ),
//     Mood(
//       iconPath: 'assets/images/Happy.png',
//       name: 'Happy',
//       size: 24,
//       color: ThemeColor.happyColor,
//     ),
//     Mood(
//       iconPath: 'assets/images/Neutral.png',
//       name: 'Neutral',
//       size: 24,
//       color: ThemeColor.nautralColor,
//     ),
//     Mood(
//       iconPath: 'assets/images/Bad.png',
//       name: 'Bad',
//       size: 24,
//       color: ThemeColor.badColor,
//     ),
//     Mood(
//       iconPath: 'assets/images/Awful.png',
//       name: 'Awful',
//       size: 24,
//       color: ThemeColor.awfulColor,
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     loadSelectedEmoji();
//   }

//   Future<void> loadSelectedEmoji() async {
//     try {
//       // Read the selected emoji name from wherever you store it.
//       final emojiName =
//           ''; // Replace with your logic to load the selected emoji.

//       setState(() {
//         selectedEmojiName = emojiName;
//       });
//     } catch (error) {
//       print('Error loading emoji: $error');
//     }
//   }

//   Future<void> saveEmojiLocally(Emoji emoji) async {
//     try {
//       // Save the selected emoji name wherever you need to.
//       final emojiName =
//           emoji.name; // Replace with your logic to save the emoji.

//       setState(() {
//         selectedEmojiName = emojiName;
//         emojiMap[emojiName] = emoji;
//       });
//     } catch (error) {
//       print('Error saving emoji: $error');
//     }
//   }

//   Future<void> showImagePickerDialog(BuildContext context) async {
//     final shouldUpdateImage = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             "Select Image Source",
//             style: TextStyle(
//               fontFamily: 'KantumruyPro',
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: ThemeColor.mainColor,
//             ),
//           ),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 ButtonTheme(
//                   minWidth: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       Navigator.of(context).pop(true);
//                       await detailsController.takePhoto();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: ThemeColor.colorScheme.onSurface,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         const SizedBox(width: 12),
//                         Icon(
//                           Icons.camera_alt,
//                           size: 20,
//                           color: ThemeColor.blueColor,
//                         ),
//                         const SizedBox(width: 12),
//                         Text(
//                           "Take a picture",
//                           style: TextStyle(
//                             fontFamily: 'KantumruyPro',
//                             fontSize: 14,
//                             color: ThemeColor.blueColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 ButtonTheme(
//                   minWidth: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       Navigator.of(context).pop(true);
//                       await detailsController.pickImageFromGallery();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: ThemeColor.colorScheme.onSurface,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         const SizedBox(width: 12),
//                         Icon(
//                           Icons.photo,
//                           size: 20,
//                           color: ThemeColor.blueColor,
//                         ),
//                         const SizedBox(width: 12),
//                         Text(
//                           "Choose from gallery",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: 'KantumruyPro',
//                             color: ThemeColor.blueColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//               child: Text(
//                 "Cancel",
//                 style: TextStyle(
//                   fontFamily: 'KantumruyPro',
//                   color: ThemeColor.mainColor,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> showEmojiPicker(BuildContext context) async {
//     // Replace this function with your emoji picker logic.
//     // Use the selected emoji as needed in your DetailsController.
//   }

//   Future<void> showMoodPicker(BuildContext context) async {
//     final selectedMood = await showModalBottomSheet<Mood>(
//       context: context,
//       builder: (BuildContext context) {
//         return ListView.builder(
//           itemCount: moods.length,
//           itemBuilder: (context, index) {
//             final mood = moods[index];
//             return ListTile(
//               leading: GestureDetector(
//                 onTap: () {
//                   // Handle mood selection
//                   setState(() {
//                     this.selectedMood = mood;
//                   });
//                   Navigator.of(context).pop(mood);
//                 },
//                 child: Image.asset(
//                   mood.iconPath,
//                   width: 50,
//                   height: 50,
//                 ),
//               ),
//               title: Text(mood.name),
//             );
//           },
//         );
//       },
//     );

//     if (selectedMood != null) {
//       // Handle selected mood here if needed
//       print("Selected Mood: ${selectedMood.name}");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           color: ThemeColor.blueColor,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Obx(() {
//                 return detailsController.imageFile.value != null &&
//                         detailsController.imageFile.value!.existsSync()
//                     ? SizedBox(
//                         height: 200,
//                         child: Image.file(
//                           detailsController.imageFile.value!,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     : Container();
//               }),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: titleController,
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: ThemeColor.colorScheme.onSurface,
//                       ),
//                       onChanged: (value) =>
//                           detailsController.setTitle(value),
//                       decoration: InputDecoration(
//                         hintText: 'What is your title?',
//                         hintStyle: TextStyle(
//                           color: ThemeColor.colorScheme.onSurface,
//                           fontFamily: 'KantumruyPro',
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             showImagePickerDialog(context);
//                           },
//                           icon: Icon(
//                             Icons.photo,
//                             color: ThemeColor.colorScheme.onSurface,
//                             size: 24,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             showEmojiPicker(context);
//                           },
//                           icon: selectedEmojiName != null
//                               ? Text(
//                                   emojiMap[selectedEmojiName!]?.emoji ?? '',
//                                   style: TextStyle(
//                                     fontSize: 24,
//                                     color: ThemeColor.colorScheme.onSurface,
//                                   ),
//                                 )
//                               : Icon(
//                                   Icons.emoji_emotions,
//                                   color: ThemeColor.colorScheme.onSurface,
//                                   size: 24,
//                                 ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             showMoodPicker(context);
//                           },
//                           icon: selectedMood != null
//                               ? Image.asset(
//                                   selectedMood!.iconPath,
//                                   width: 28,
//                                   height: 28,
//                                 )
//                               : Icon(
//                                   Icons.mood,
//                                   color: ThemeColor.colorScheme.onSurface,
//                                   size: 24,
//                                 ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.share,
//                             color: ThemeColor.colorScheme.onSurface,
//                             size: 24,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const Divider(),
//               TextField(
//                 controller: descriptionController,
//                 style: TextStyle(
//                   color: ThemeColor.colorScheme.onSurface,
//                 ),
//                 maxLines: null,
//                 onChanged: (value) => detailsController.setDescription(value),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "What's on your mind?",
//                   hintStyle: TextStyle(
//                     fontFamily: 'KantumruyPro',
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: ThemeColor.colorScheme.onSurface,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
