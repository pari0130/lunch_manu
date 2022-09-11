import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/theme/color.dart';
import 'package:lunch_manu/fonts/fonts.dart';
import 'package:lunch_manu/status/status.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, required this.data, this.seleted = false, this.onTap})
      : super(key: key);
  final data;
  final bool seleted;
  final GestureTapCallback? onTap;
  final TagsPlaceStatus tagsStatus = Get.put(TagsPlaceStatus());
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tagsStatus.updateTag(data["name"]);
        logger.d(
            "[CATEGORY] selected tag -> { name : ${tagsStatus.selectedTag} }");
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 10),
          width: 90,
          decoration: BoxDecoration(
            color: tagsStatus.selectedTag.value == data["name"]
                ? primary
                : cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.05),
                spreadRadius: .5,
                blurRadius: .5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(data["icon"],
                  size: 17,
                  color: tagsStatus.selectedTag.value == data["name"]
                      ? Colors.white
                      : darker),
              SizedBox(
                width: 7,
              ),
              Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: tagsStatus.selectedTag.value == data["name"]
                      ? Colors.white
                      : darker,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
