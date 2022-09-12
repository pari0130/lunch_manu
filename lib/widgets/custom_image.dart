import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lunch_manu/theme/color.dart';

import '../assets/custom_image.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(this.name,
      {this.width = 100,
      this.height = 100,
      this.bgColor,
      this.borderWidth = 0,
      this.borderColor,
      this.trBackground = false,
      this.isNetwork = true,
      this.radius = 50});

  final String name;
  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? cardColor, width: borderWidth),
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 2), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: (name.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: name,
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
    );
  }
}
