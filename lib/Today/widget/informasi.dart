import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformasiToday extends StatelessWidget {
  final List<Map<String, dynamic>> content;
  
  const InformasiToday({
    required this.content,
    super.key});

  //Example Map of Content:
  /*
  [
    {
      "title": "Can i be a good mother?",
      "image-title": "assets/image/abc.png"
    },
    {
      "title": "Keterkaitan Hormon dan Insomnia",
      "image-title": "assets/image/abc.png"
    }
  ]
  */

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Informasi",
            style: GoogleFonts.poppins(
              color: Color(0xFF5B506E),
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 113,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: content.length,
              itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  width: 58,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Image.asset("${content[index]["image-title"]!}"),
                      ),
                      SizedBox(height: 12,),
                      Expanded(
                        child: Text("${content[index]["title"]}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF1A0F39),
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}