import 'package:flutter/material.dart';
import 'package:lunch_manu/theme/color.dart';
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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
              data.thumUrl ?? "",
              width: 60,
              height: 60,
              radius: 10,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: gmarketSansTTFMedium)),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                      data.microReview != null
                          ? ListUtil.getFirstFromList(list: data.microReview!)
                          : "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: gmarketSansTTFMedium)),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      //Icon(Icons.star_rounded, size: 14, color: primary,),
                      //SizedBox(width: 2,),
                      //Text(data["rate"] + " (" + data["rate_number"] + ")", style: TextStyle(fontSize: 12, color: primary)),
                      Text(
                          "${Location.getDistance(latLong, "${data.x};${data.y}").round()}m",
                          // "${double.parse(data.distance ?? "0.0").round()}m",
                          style: TextStyle(
                              fontSize: 12,
                              color: primary,
                              fontFamily: gmarketSansTTFMedium)),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                //Text(data["price"],  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primary)),
                //SizedBox(height: 10,),
                // FavoriteBox(iconSize: 13, isFavorited: data["is_favorited"],)
                FavoriteBox(
                  data: data,
                  iconSize: 13,
                  isFavorited: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
