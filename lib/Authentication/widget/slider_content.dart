import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';

class SliderContent extends StatelessWidget {
  final String imageAsset;
  final String headlineText;
  final String sublineText;

  SliderContent({
    Key? key,
    required this.imageAsset,
    required this.headlineText,
    required this.sublineText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, 
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              top: 100,
              left: -70,
              right: -70,
              child: Image.asset(imageAsset)
              ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: CustomPaint(
                size: Size(300, 300), // Set the width to screen width and height to 100
                painter: _CurvedPainter(),
              ),
            ),
            // Content
            Positioned(
              top: 375,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(headlineText,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF151524)
                      ),
                    ),
                    Text(sublineText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9D93BB)
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
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
