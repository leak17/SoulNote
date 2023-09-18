import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShareView extends StatelessWidget {
  ShareView({super.key});

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: CustomAppBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
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
                      controller: _searchController,
                      focusNode: _searchFocusNode,
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
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final formattedTime = DateFormat('kk:mm:ss \n EEE d MMM')
                      .format(DateTime.now());

                  return Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: ThemeColor.mainColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          formattedTime,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      title: const Text('Koh Kong Trip'),
                      subtitle: Text(
                        'Notice your mood and track output everyday. Find your strength and weakness to improve to gain more...',
                        maxLines: 3,
                        style: TextStyle(
                          fontFamily: 'KantumruyPro',
                          color: ThemeColor.colorScheme.background,
                        ),
                      ),
                      trailing: const Icon(Icons.emoji_emotions),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
