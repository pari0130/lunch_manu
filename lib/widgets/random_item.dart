import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lunch_manu/fonts/fonts.dart';
import 'package:lunch_manu/theme/color.dart';
import 'package:lunch_manu/models/models.dart';
import 'package:lunch_manu/assets/assets.dart';
import 'favorite_box.dart';

class RandomItem extends StatelessWidget {
  const RandomItem({Key? key, required this.data}) : super(key: key);
  final NaverPlaceModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      height: 170, width: 220,
      // color: secondary,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: SizedBox(
              height: 120,
              width: 220,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: (data.thumUrl != null && data.thumUrl!.isNotEmpty)
                      ? CachedNetworkImage(
                          imageUrl: data.thumUrl!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: emptyThum02,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 5,
              child: FavoriteBox(
                // isFavorited: data["is_favorited"],
                isFavorited: true,
              )),
          Positioned(
            top: 140,
            child: SizedBox(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(data.name ?? "",
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: gmarketSansTTFMedium),
                              maxLines: 1)),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${double.parse(data.distance??"0.0").round()}m",
                        style: const TextStyle(
                            fontSize: 13,
                            color: primary,
                            fontWeight: FontWeight.w600,
                            fontFamily: gmarketSansTTFMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
