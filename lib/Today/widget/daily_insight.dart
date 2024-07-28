import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/state_util.dart';

class DailyInsight extends StatelessWidget {
  final List<Map<String, dynamic>> content;
  
  const DailyInsight({
    required this.content,
    super.key});

  //Example Map of Content:
  /*
  [
    {
      "title": "Can i be a good mother?",
      "background-color": Color(0xFFFFF),
      "image-decoration": "assets/image/abc.png"
    },
    {
      "title": "Keterkaitan Hormon dan Insomnia",
      "background-color": Color(0xFFFFF),
      "image-decoration": "assets/image/abc.png"
    }
  ]
  */
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Daily Insight",
            style: GoogleFonts.poppins(
              color: Color(0xFF5B506E),
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),
          ),
          SizedBox(height: 8,),
          Container(
            height: 104,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: _dailyInsightCard(
                    content[index]["title"]!, 
                    content[index]["image-decoration"]!,
                    content[index]["background-color"]
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }

  Widget _dailyInsightCard(String title, String imgSrc, Color background){
    return Container(
      width: 83,
      height: 104,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadiusDirectional.circular(10)
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(imgSrc)                
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6,6,12,6),
            child: Text(title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}