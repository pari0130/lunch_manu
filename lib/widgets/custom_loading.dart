import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lunch_manu/theme/color.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({this.height = 170, this.width = 220, super.key, this.left = 15});
  final double? height;
  final double? width;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(bottom: 5, left: left),
      child : const SpinKitCircle(
        color: primary,
      ),
    );
  }
}
