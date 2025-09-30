import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widget/vertical_spacing.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DrawerWidgetState();
  }
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/newspaper.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const VerticalSpacing(20),
                  Flexible(
                    child: Text(
                      'News app',
                      style: GoogleFonts.lobster(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ListTiles(
              label: 'Home',
              function: () {},
              iconData: IconlyBold.home,
            ),
            ListTiles(
              label: 'Bookmark ',
              function: () {},
              iconData: IconlyBold.bookmark,
            ),
            const Divider(),
            SwitchListTile(
              title: Text(
                themeProvider.getDarkTheme ? 'Dark' : 'Light',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              secondary: Icon(
                themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              value: themeProvider.getDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
    required this.label,
    required this.function,
    required this.iconData,
  });

  final String label;
  final Function function;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      leading: Icon(iconData, color: Theme.of(context).colorScheme.secondary),
      onTap: () {
        function();
      },
    );
  }
}
