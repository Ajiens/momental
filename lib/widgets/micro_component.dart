import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Container profilePicture(String sourceImage, {double? size, Border? border}){
    return Container( //Profile image
      width: size ?? 44,
      height: size ?? 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(118)),
        border: border,
        color: Color(0xFF9A89FC),
        image: DecorationImage(image: AssetImage(sourceImage))
      ),
      // child: Image.asset("assets/image/Character 1.png", fit: BoxFit.fill,),
    );
  }

Row iconText (String svgIcon, double sizeIcon, Text label){
  return Row(
    children: [
      SvgPicture.asset(svgIcon, width: sizeIcon, height: sizeIcon,),
      SizedBox(width: 6,),
      label,
    ],
  );
}