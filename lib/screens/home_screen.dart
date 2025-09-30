import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../services/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color color = Utils(context).getColor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            'News app',
            style: GoogleFonts.lobster(
              textStyle: TextStyle(
                fontSize: 20,
                letterSpacing: 0.6,
                color: color,
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(IconlyBroken.search)),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).cardColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('All news', style: TextStyle(fontSize: 22)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).cardColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('All news', style: TextStyle(fontSize: 22)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
