import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Forum/pages/forum_scroll.dart';

import 'package:momental/constant/color_pallete.dart';
import 'package:momental/Forum/widget/postingan_card.dart';
import 'package:momental/Forum/widget/tagline_forum_card.dart';
import 'package:momental/widgets/header_option.dart';
import 'package:momental/Forum/widget/mood_today.dart';


class Forum extends StatelessWidget {
  const Forum({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderApp(
      withOption: false,
      leftCorner: Row(
        children: [
          SvgPicture.asset(
            "assets/svg/2friends.svg"
          ),
          SizedBox(width: 12,),
          Text("Komunitas",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: FoundationViolet.violet1
            ),
          )
        ],
      ),
      rightCorner: Row(
        children: [
          Text("Lihat semua",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: BlueMarguerite.shade400
            ),
          ),
          SizedBox(width: 4,),
          GestureDetector(
            onTap: (){},
            child: Icon(Icons.arrow_forward_ios_outlined,
              size: 20,
              color: BlueMarguerite.shade400,
            ),
          )
        ],
      ),
      pageContent: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              children: [
                const MoodToday(),

                const SizedBox(height:14),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      bottomLainnya(),
                      const SizedBox(width:12),
                      TaglineForumCard(topTag: "MomHope Indonesia", buttomMainTag: "Keluh Kesahkan", buttomSubTag: "Mommy Mental"),
                      const SizedBox(width:12),
                      TaglineForumCard(topTag: "Sehati", buttomMainTag: "Pendengar", buttomSubTag: "Sehati"),
                      const SizedBox(width:12),
                      TaglineForumCard(topTag: "MomHope Indonesia", buttomMainTag: "Keluh Kesahkan", buttomSubTag: "Mommy Mental"),
                    ],
                  ),
                ),
                // Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ScrollingForum()
                ),
              ],
            ),
          )
        ),
      ],
    );
  }

  GestureDetector bottomLainnya(){
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 183, // Height sesuai dengan TaglineForumCard()
        decoration: BoxDecoration(
          color: FoundationViolet.violet1,
          borderRadius: BorderRadius.circular(24)
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Lainnya",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Style.blackText
                ),
              ),
              SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  color: FoundationRed.normal,
                  borderRadius: BorderRadius.circular(18)
                ),
                height: 41,
                width: 41,
                child: Icon(Icons.add_outlined, color: Colors.white, size: 30,),
              )
            ],
          ),
        ),
      )
    );
  }
}