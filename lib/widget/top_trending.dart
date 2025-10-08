import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/utils.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {},
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset('assets/images/empty_image.png'),
                  imageUrl:
                      'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTFMg6y4IVyDA_F4sM7e9Ri6KEwOYDy-OaN3RgbpGMz2zM2ntaHMTWfsRM0BMRjb4NGqpi6-cj5NcKLwDHprVQ_zBH1wNisueo3BNWHSDb_',
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Title',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.link, color: color),
                  ),
                  const Spacer(),
                  SelectableText(
                    '21-11-2001',
                    style: GoogleFonts.montserrat(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
