import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/widgets/micro_component.dart';

class MoodToday extends StatelessWidget {
  const MoodToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 122,
        decoration: BoxDecoration(
          color: FoundationViolet.violet1,
          borderRadius: BorderRadius.all(Radius.circular(24))
        ),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              MoodTextField(),
              SizedBox(height: 12,),
              Row(
                children: [
                  iconText("assets/svg/chart.svg", 18, Text("Polling Pengalaman",
                                                        style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12,
                                                          color: FoundationViolet.violet7
                                                        ),
                                                      )),
                  Spacer(),
                  iconText("assets/svg/smile.svg", 18, Text("Bagi Perasaan",
                                                        style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12,
                                                          color: FoundationViolet.violet7
                                                        ),
                                                      ))
                ],
              )
            ],
          )
        ),
    );
  }

  Row MoodTextField(){
    return Row(
      children: [
        profilePicture("assets/image/alwan.jpg"),
        SizedBox(width: 8,),
        Expanded(
          child: GestureDetector(
            onTap: () { }, //TODO: Pindah ke halaman lain untuk isi text
            child: Container(
              alignment: Alignment.centerLeft,
              height: 44,
              decoration: BoxDecoration(
                color: FoundationViolet.violet4,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text( "Apa yang Anda rasakan hari ini?",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: FoundationViolet.violet7
                  ),
                ),
              )
            ),
          )
        ),
      ],
    );
  }

}