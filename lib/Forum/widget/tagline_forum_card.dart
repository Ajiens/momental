import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/widgets/micro_component.dart';

class TaglineForumCard extends StatelessWidget {
    final String topTag;
    final String buttomMainTag;
    final String buttomSubTag;
    // final List<Widget> pesertaAvatar; TODO Harusnya ada ini untuk define gambar

    TaglineForumCard({
    Key? key,
      required this.topTag,
      required this.buttomMainTag,
      required this.buttomSubTag,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 183,
      decoration: BoxDecoration(
        color: FoundationViolet.violet1,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Column(
        children: [ 
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(topTag,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Style.blackText
                  ),
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Container(
                      height: 44,
                      width: 135,
                      child: Stack(
                        children: [ // TODO: Harus diganti dengan List<Widget> pesertaAvatar
                          Positioned(
                            left: 0,
                            child: profilePicture("assets/image/alwan.jpg", border: Border.all(color: Colors.white, width: 2.5)),
                          ),
                          Positioned(
                            left: 30,
                            child: profilePicture("assets/image/alwan.jpg", border: Border.all(color: Colors.white, width: 2.5)),
                          ),
                          Positioned(
                            left: 60,
                            child: profilePicture("assets/image/alwan.jpg", border: Border.all(color: Colors.white, width: 2.5)),
                          ),
                          Positioned(
                            left: 90,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: BlueMarguerite.shade200,
                              child: Text(
                                '+59',
                                style: GoogleFonts.poppins(
                                  color: BlueMarguerite.shade500,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
                color: BlueMarguerite.shade50,
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(buttomSubTag,
                      style: GoogleFonts.poppins(
                        color: FoundationViolet.violet7,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                      ),
                    ),
                    Row(
                      children: [
                        Text( "#",
                          style: GoogleFonts.poppins(
                            color: FoundationRed.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                          ),
                        ),
                        SizedBox(width: 6,),
                        Text( buttomMainTag,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.poppins(
                            color: FoundationViolet.violet13,
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            )
          ),
        ],
      )
    );
  }
}