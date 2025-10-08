import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/consts/vars.dart';
import 'package:news_app/widget/articles_widgets.dart';
import 'package:news_app/widget/drawer_widget.dart';
import 'package:news_app/widget/tabs.dart';
import 'package:news_app/widget/top_trending.dart';
import 'package:news_app/widget/vertical_spacing.dart';

import '../services/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  int currentPageIndex = 0;
  String sortBy = SortByEnum.popularity.name;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    Size size = Utils(context).getScreenSize;

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
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    TabsWidget(
                      text: 'All news',
                      color: newsType == NewsType.allNews
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.allNews) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.allNews;
                        });
                      },
                      fontSize: newsType == NewsType.allNews ? 22 : 14,
                    ),
                    const SizedBox(width: 20),
                    TabsWidget(
                      text: 'Top trending',
                      color: newsType == NewsType.topTrending
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      function: () {
                        if (newsType == NewsType.topTrending) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.topTrending;
                        });
                      },
                      fontSize: newsType == NewsType.topTrending ? 22 : 14,
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(10),
              newsType == NewsType.topTrending
                  ? Container()
                  : SizedBox(
                      height: kBottomNavigationBarHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          paginationButtons(
                            function: () {
                              if (currentPageIndex <= 0) {
                                return;
                              }
                              setState(() {
                                currentPageIndex -= 1;
                              });
                            },
                            text: 'Prev',
                          ),
                          Flexible(
                            flex: 2,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 80,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    color: currentPageIndex == index
                                        ? Colors.blue
                                        : Theme.of(context).cardColor,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentPageIndex = index;
                                        });
                                      },
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${index + 1}',
                                            style: const TextStyle(height: 1.2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          paginationButtons(
                            function: () {
                              if (currentPageIndex >= 79) {
                                return;
                              }
                              setState(() {
                                currentPageIndex += 1;
                              });
                            },
                            text: 'Next',
                          ),
                        ],
                      ),
                    ),
              const VerticalSpacing(10),
              newsType == NewsType.topTrending
                  ? Container()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Material(
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton(
                            value: sortBy,
                            items: dropdownItems,
                            onChanged: (String? value) {},
                          ),
                        ),
                      ),
                    ),
              if (newsType == NewsType.allNews)
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (ctx, index) {
                      return const ArticlesWidgets();
                    },
                  ),
                ),
              if (newsType == NewsType.topTrending)
                SizedBox(
                  height: size.height * 0.6,
                  child: Swiper(
                    autoplay: true,
                    autoplayDelay: 5000,
                    itemWidth: size.width * 0.9,
                    viewportFraction: 0.9,
                    layout: SwiperLayout.STACK,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const TopTrendingWidget();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
        child: Text(SortByEnum.relevancy.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(SortByEnum.popularity.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(SortByEnum.publishedAt.name),
      ),
    ];
    return menuItems;
  }

  Widget paginationButtons({required Function function, required String text}) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(6),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
