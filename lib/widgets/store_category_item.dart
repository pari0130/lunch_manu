import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/theme/color.dart';

class StoreCategoryItem extends StatelessWidget {
  StoreCategoryItem({Key? key, required this.name})
      : super(key: key);
  final name;
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(right: 10),
        //width: 50,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          name,
          maxLines: 1,
          //overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11,
            color: darker,
          ),
        )
      );
  }
}
