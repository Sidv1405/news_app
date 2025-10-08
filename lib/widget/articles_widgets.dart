import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/utils.dart';
import 'package:news_app/widget/vertical_spacing.dart';

import '../consts/vars.dart';

class ArticlesWidgets extends StatelessWidget {
  const ArticlesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Material(
      color: Theme.of(context).cardColor,
      child: GestureDetector(
        onTap: () {},
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
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(
                      height: size.height * 0.12,
                      width: size.height * 0.12,
                      boxFit: BoxFit.fill,
                      imageUrl:
                          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTFMg6y4IVyDA_F4sM7e9Ri6KEwOYDy-OaN3RgbpGMz2zM2ntaHMTWfsRM0BMRjb4NGqpi6-cj5NcKLwDHprVQ_zBH1wNisueo3BNWHSDb_',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'title ' * 100,
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: smallTextStyle,
                        ),
                        const VerticalSpacing(5),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('Reading time', style: smallTextStyle),
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.link,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                '21-11-2001 ' * 2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: smallTextStyle,
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
          ],
        ),
      ),
    );
  }
}
