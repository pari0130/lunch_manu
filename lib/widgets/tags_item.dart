import 'package:flutter/material.dart';
import 'package:lunch_manu/theme/color.dart';
import 'package:lunch_manu/widgets/store_category_item.dart';
import 'package:lunch_manu/widgets/widgets.dart';
import 'package:lunch_manu/models/models.dart';
import 'favorite_box.dart';
import 'package:lunch_manu/utils/utils.dart';
import 'package:lunch_manu/fonts/fonts.dart';

class TagsItem extends StatelessWidget {
  const TagsItem(
      {Key? key, required this.data, this.onTap, required this.latLong})
      : super(key: key);
  final NaverPlaceModel data;
  final GestureTapCallback? onTap;
  final String latLong;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
              data.thumUrl ?? "",
              width: 77,
              height: 77,
              radius: 10,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: gmarketSansTTFMedium)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      (data.microReview != null && data.microReview!.isNotEmpty)
                          ? ListUtil.getFirstFromList(list: data.microReview!)
                          : "-",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: gmarketSansTTFMedium)),
                  const SizedBox(
                    height: 3,
                  ),
                  listStoreCategories(data.category??[]),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                          "${Location.getDistance(latLong, "${data.x};${data.y}").round()}m",
                          // "${double.parse(data.distance ?? "0.0").round()}m",
                          style: const TextStyle(
                              fontSize: 11,
                              color: blue,
                              fontFamily: gmarketSansTTFMedium)),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                FavoriteBox(
                  data: data,
                  iconSize: 13,
                  //isFavorited: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  listStoreCategories(List<String> categoryList){
    List<Widget> lists = List.generate(categoryList.length, (index) => StoreCategoryItem(name: categoryList[index]));
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(bottom: 5, right: 10),
        child: Row(
            children: lists
        ),
      );
  }
}
