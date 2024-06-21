import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/theme/color_pallete.dart';
import 'package:momental/widgets/Autentikasi/slider_content.dart';
import 'package:momental/widgets/navbar.dart';

class SliderAuthentication extends StatefulWidget {
  SliderAuthentication({super.key});

  @override
  State<SliderAuthentication> createState() => _SliderAuthenticationState();
}

class _SliderAuthenticationState extends State<SliderAuthentication> {
  late final PageController pageController;
  int pageNo = 0;

  Timer? elementTimer;

  final List<List<String>> contentElement = [
    [
        "assets/image/Pregnancy Stage.png", 
        "Manajemen Mental",
        "Pendampingan untuk ibu semenjak hamil hingga pasca melahirkan"
    ],
    [
        "assets/image/BPJS & KIS.png", 
        "Dukungan BPJS dan KIS",
        "Dukungan untuk konseling pada faskes pertama dan rujukan"
    ],
    [
        "assets/image/Ibu dan Peer Berbincang.png", 
        "Komunitas Sebaya",
        "Interaksi dan bercerita dengan saling empati"
    ],
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    elementTimer = getTimer();
    super.initState();
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
  
  Timer getTimer(){
    return Timer.periodic(const Duration(seconds: 3), (timer) { 
      if (pageNo == 3){
        pageNo = 0;
      }
      pageController.animateToPage(pageNo, 
        duration: const Duration(seconds: 1), 
        curve: Curves.easeInOutCirc
      );
      pageNo++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, 
      child: Container(
        height: 480,
        color: BlueMarguerite.shade600,
        child: Stack(
          children: [
            PageView.builder(
              itemCount: contentElement.length,
              controller: pageController,
              onPageChanged: (index){
                pageNo = index;
                setState(() {});
              },
              itemBuilder: (context, index) {
                List<String> currentContent;
                if (index == 0){
                  currentContent = contentElement[0];
                } else if (index == 1){
                  currentContent = contentElement[1];
                } else if (index == 2){
                  currentContent = contentElement[2];
                } else{
                  currentContent = contentElement[0];
                }

                return GestureDetector(
                  onPanDown: (d){
                    elementTimer?.cancel();
                    elementTimer = null;
                  },
                  onPanCancel: () => elementTimer = getTimer(),
                  child: SliderContent(
                    imageAsset: currentContent[0], 
                    headlineText: currentContent[1], 
                    sublineText: currentContent[2]
                  ),
                );
              },
            ),
            pageIndicator(),
          ]
        )
      )
    );
  }


  Widget pageIndicator(){
    return Positioned(
      bottom: 0,
      left: 0,
      right: 10,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            contentElement.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn
                  );
                },
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: pageNo == index
                  ? BlueMarguerite.shade600
                  :Color.fromRGBO(21, 21, 36, 0.2),
                ),
              ),
            )
          ),
        ),
      )
    );
  }
}


class _CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.2); // Start at 20% of height
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, size.height * 0.2); // Draw a curved path
    path.lineTo(size.width, size.height); // Draw line to bottom right
    path.lineTo(0, size.height); // Draw line to bottom left
    path.close(); // Complete the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}