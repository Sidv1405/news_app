import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widget/empty_screen.dart';

import '../services/utils.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'Bookmarks',
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              fontSize: 20,
              letterSpacing: 0.6,
              color: color,
            ),
          ),
        ),
      ),
      body: const EmptyNewsWidget(
        text: 'You didn\'t add anything yet to your bookmarks ',
        imagePath: 'assets/images/bookmark.png',
      ),
      //   Expanded(
      // child: ListView.builder(
      // itemCount: 20,
      //   itemBuilder: (ctx, index) {
      //     return const ArticlesWidgets();
      //   },
      // ),
    );
  }
}
