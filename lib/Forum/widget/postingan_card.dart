import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Forum/models/postingan.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/Forum/widget/vote_bar.dart';
import 'package:momental/widgets/icon_label.dart';
import 'package:momental/widgets/micro_component.dart';

class PostinganCard extends StatelessWidget {
    final Postingan postingan;

    PostinganCard({
    Key? key,
      required this.postingan
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: FoundationViolet.violet1
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          children: [
            headerTag(postingan.namaKomunitas, postingan.tagline),
            const SizedBox(height: 12,),
            profileInformation(postingan.username, postingan.createdAt),
            konten(postingan.konten, false) // TODO: bool = postingan.isPoll
          ],
        ),
      )
    );
  }

  Widget headerTag(String namaKomunitas, String tagline){
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: BlueMarguerite.shade50
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Text(namaKomunitas,
                style: GoogleFonts.poppins(
                  color: FoundationViolet.violet13,
                  fontWeight: FontWeight.w600,
                  fontSize: 12
                )
              ),
              const SizedBox(width: 4,),
              Text("#",
                style: GoogleFonts.poppins(
                  color: FoundationRed.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 14
                ),
              ),
              const SizedBox(width: 4,),
              Text(tagline,
                style: GoogleFonts.poppins(
                  color: FoundationViolet.violet13,
                  fontWeight: FontWeight.w700,
                  fontSize: 14
                ),
              ),
              const Spacer(),
              Icon(Icons.keyboard_arrow_right_outlined, color: FoundationViolet.violet7,)
            ],
          ),
        ),
      )
    );
  }

  Widget profileInformation(String namaProfile, DateTime waktuPosting){
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          profilePicture("assets/image/alwan.jpg"),
          const SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(namaProfile,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: FoundationViolet.violet8
                ),
              ),
              Text(formatDate(waktuPosting),
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: FoundationViolet.violet7
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget konten(String strKonten, bool isProgress){
    return Container(
      child: Column(
        children: [ 
          SizedBox(height: 12,),
          Text(strKonten,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: FoundationViolet.violet13
            ),
          ),
          if (isProgress)...[
            VoteBar(percentage: 90, label: "Saya"),
            VoteBar(percentage: 20, label: "Tidak Pernah")
          ],
          
          SizedBox(height: 8,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconLabel(
                beforeIconAsset: "assets/svg/like.svg",
                afterIconAsset: "assets/svg/liked.svg", 
                labelIcon: Text("1.6K",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: FoundationViolet.violet13
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              IconLabel(
                beforeIconAsset: "assets/svg/comment.svg",
                afterIconAsset: "assets/svg/commented.svg", 
                labelIcon: Text("20",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: FoundationViolet.violet13
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              if (isProgress)...[
                IconLabel(
                  beforeIconAsset: "assets/svg/comment.svg",
                  afterIconAsset: "assets/svg/commented.svg", 
                  labelIcon: Text("100 orang memberi vote",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: FoundationViolet.violet13
                    ),
                  ),
                )
              ],
            ],
          )
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
  final DateTime today = DateTime.now();
  final Duration difference = today.difference(date);

  if (difference.inDays < 7) {
    return '${difference.inDays} hari yang lalu';
  } else {
    return date.toString().split(" ")[0];
  }
}
}