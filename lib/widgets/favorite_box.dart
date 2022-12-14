import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/theme/color.dart';
import 'package:lunch_manu/models/models.dart';
import 'package:lunch_manu/utils/file_util.dart';

class FavoriteBox extends StatelessWidget {
  // FavoriteBox({ Key? key, this.padding = 5, this.iconSize = 18, this.isFavorited = false, this.onTap, required this.data}) : super(key: key);
  FavoriteBox({ Key? key, this.padding = 5, this.iconSize = 18, this.onTap, required this.data}) : super(key: key);
  final double padding;
  final double iconSize;
  final GestureTapCallback? onTap;
  final logger = Logger();
  final NaverPlaceModel data;
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
        onTap:  () {
          FileUtil.saveFavoriteData(data.toJson());
          isFavorited = !isFavorited;
          logger.d(
              "[FAVORITE] FavoriteBox -> { selected : ${data.name} }");
        },
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: const BoxDecoration(
            color: primary,
            shape: BoxShape.circle
          ),
          child: Icon(isFavorited ? Icons.favorite_rounded : Icons.favorite_outline_rounded, size: iconSize, color: Colors.white,)
        ),
      );
  }
}