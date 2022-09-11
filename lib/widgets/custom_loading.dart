import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lunch_manu/theme/color.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({this.height = 170, this.width = 220, super.key});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child : const SpinKitCircle(
        color: primary,
      ),
    );
  }
}
