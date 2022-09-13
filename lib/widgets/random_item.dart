import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/fonts/fonts.dart';
import 'package:lunch_manu/theme/color.dart';
import 'package:lunch_manu/models/models.dart';
import 'package:lunch_manu/assets/assets.dart';
import 'package:lunch_manu/widgets/store_category_item.dart';
import 'favorite_box.dart';
import 'package:lunch_manu/utils/utils.dart';

class RandomItem extends StatelessWidget {
  RandomItem({Key? key, required this.data, required this.latLong})
      : super(key: key);
  final NaverPlaceModel data;
  final String latLong;
  final logger = Logger();
  static List<String> storeCategoryItemList = [];

  @override
  void initState() {
    if (data.category != null && data.category!.isNotEmpty) {
      storeCategoryItemList.addAll(data.category!);
    }
    logger.d("check -> $storeCategoryItemList");
    //this.storeCategoryItemList =
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      height: 180, width: 220,
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
                data: data,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name ?? "",
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: gmarketSansTTFMedium),
                                maxLines: 1),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 170,
                                  child:
                                      listStoreCategories(data.category ?? []),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${Location.getDistance(latLong, "${data.x};${data.y}").round()}m",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: blue,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: gmarketSansTTFMedium),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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

  listStoreCategories(List<String> categoryList) {
    List<Widget> lists = List.generate(categoryList.length,
        (index) => StoreCategoryItem(name: categoryList[index]));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, right: 10),
      child: Row(children: lists),
    );
  }
}
