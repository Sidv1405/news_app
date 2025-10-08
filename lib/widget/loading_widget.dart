import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:news_app/consts/vars.dart';
import 'package:news_app/services/utils.dart';
import 'package:news_app/widget/vertical_spacing.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidgets extends StatefulWidget {
  const LoadingWidgets({super.key, required this.newsType});

  final NewsType newsType;

  @override
  State<LoadingWidgets> createState() => _LoadingWidgetsState();
}

class _LoadingWidgetsState extends State<LoadingWidgets> {
  BorderRadius borderRadius = BorderRadius.circular(18);
  late Color baseShimmerColor, highlightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utils = Utils(context);
    baseShimmerColor = utils.baseShimmerColor;
    highlightShimmerColor = utils.highlightShimmerColor;
    widgetShimmerColor = utils.widgetShimmerColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return widget.newsType == NewsType.topTrending
        ? Swiper(
            autoplayDelay: 5000,
            autoplay: true,
            itemWidth: size.width * 0.9,
            layout: SwiperLayout.STACK,
            itemCount: 5,
            itemBuilder: (context, index) {
              return TopTrendingLoadingWidget(
                baseShimmerColor: baseShimmerColor,
                highlightShimmerColor: highlightShimmerColor,
                size: size,
                borderRadius: borderRadius,
                widgetShimmerColor: widgetShimmerColor,
              );
            },
          )
        : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (ctx, index) {
                return ArticlesShimmerEffectWidget(
                  baseShimmerColor: baseShimmerColor,
                  highlightShimmerColor: highlightShimmerColor,
                  size: size,
                  borderRadius: borderRadius,
                  widgetShimmerColor: widgetShimmerColor,
                );
              },
            ),
          );
  }
}

class TopTrendingLoadingWidget extends StatelessWidget {
  const TopTrendingLoadingWidget({
    super.key,
    required this.baseShimmerColor,
    required this.highlightShimmerColor,
    required this.size,
    required this.borderRadius,
    required this.widgetShimmerColor,
  });

  final Color baseShimmerColor;
  final Color highlightShimmerColor;
  final Size size;
  final BorderRadius borderRadius;
  final Color widgetShimmerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Shimmer.fromColors(
          baseColor: baseShimmerColor,
          highlightColor: highlightShimmerColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: size.height * 0.33,
                  width: double.infinity,
                  color: widgetShimmerColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: widgetShimmerColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: size.height * 0.025,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: widgetShimmerColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticlesShimmerEffectWidget extends StatelessWidget {
  const ArticlesShimmerEffectWidget({
    super.key,
    required this.baseShimmerColor,
    required this.highlightShimmerColor,
    required this.size,
    required this.borderRadius,
    required this.widgetShimmerColor,
  });

  final Color baseShimmerColor;
  final Color highlightShimmerColor;
  final Size size;
  final BorderRadius borderRadius;
  final Color widgetShimmerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              color: Theme.of(context).cardColor,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Shimmer.fromColors(
                baseColor: baseShimmerColor,
                highlightColor: highlightShimmerColor,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.red,
                        height: size.height * 0.12,
                        width: size.height * 0.12,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              color: Colors.red,
                            ),
                          ),
                          const VerticalSpacing(5),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: size.height * 0.025,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: borderRadius,
                                color: widgetShimmerColor,
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: size.height * 0.025,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
