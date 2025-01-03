import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/Authentication/widget/button_placeholder.dart';
import 'package:momental/Authentication/widget/slider.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Directionality(
      textDirection: TextDirection.ltr, 
      child: Scaffold(
        body: 
       Container(
        // height: 200,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SliderAuthentication(),
            ButtonPlaceholder()
          ],
        ),
      )
    ));
  }
}