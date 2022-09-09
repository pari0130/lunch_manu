import 'package:flutter/material.dart';
import 'package:lunch_manu/fonts/gmatket_font_family.dart';
import 'package:lunch_manu/theme/color.dart';

import 'favorite_box.dart';

class RandomItem extends StatelessWidget {
  RandomItem({ Key? key, required this.data }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        margin: EdgeInsets.only(right: 15),
        height: 170, width: 220,
        // color: secondary,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: Container(
                height: 120, width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data["image"])
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0, right: 5,
              child: FavoriteBox(isFavorited: data["is_favorited"],)
            ),
            Positioned(
              top: 140,
              child: Container(
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(data["name"], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, fontFamily: FontFamily.gmarketSansTTFMedium),)),
                        SizedBox(width: 5,),
                        Text(data["price"], style: TextStyle(fontSize: 13, color: primary, fontWeight: FontWeight.w600, fontFamily: FontFamily.gmarketSansTTFMedium),),
                      ],
                    ),
                  ]
                )
              ),
            )
          ],
        ),
      );
  }
}