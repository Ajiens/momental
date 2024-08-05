import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/widgets/button.dart';

import '../../Forum/widget/tagline_forum_card.dart';
import '../../constant/color_pallete.dart';
import '../../widgets/micro_component.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _appBar(),
                _body()
              ],
            ),
          ),
        
      ),
    );
  }

  Widget _appBar(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 28),
      decoration: BoxDecoration(
        color: BlueMarguerite.shade600,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
      ),
      child: Column(
        children: [
          SizedBox(height: 12,),
          Text("Pengaturan Akun",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 205,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                 height: 176,
                  decoration: BoxDecoration(
                    color: BlueMarguerite.shade700,
                    borderRadius: BorderRadius.circular(28)
                  ),
                  child: Center(
                    child: Image.asset("assets/image/jendela-biru.png"),
                  ),
                ),
                Align( // Profile Picture
                  alignment: Alignment.bottomCenter,
                  child: profilePicture("assets/image/alwan.jpg",
                    size: 80,
                    border: Border.all(color: Colors.white, width: 2)
                  ),
                ),
                Align( // Edit Button
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 80,),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Style.secondary
                        ),
                        child: Icon(Icons.mode_edit_rounded, 
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 12,),
          Text("Alwan Takahashi Aditama",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white
            ),
          ),
          SizedBox(height: 12,),
          CustomButton(
            label: Text("Informasi Akun",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ), 
            color: Style.secondary, 
            tapFunction: (){}
          ),
          SizedBox(height: 12,),
          CustomButton(
            label: Text("Ubah Password",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ), 
            color: Style.primary, 
            tapFunction: (){}
          )
        ],
      ),
    );
  }

  Widget _body(){
    return Container(
      color: Color(0xFFF8F7FF),
      padding: EdgeInsets.all(28),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: SvgPicture.asset("assets/svg/2friends.svg",
                      color: Style.primary,
                    ),
                  ),
                  SizedBox(width: 12,),
                  Text("Komunitas",
                    style: GoogleFonts.poppins(
                      color: FoundationViolet.violet13,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text("Lainnya",
                    style: GoogleFonts.poppins(
                      color: FoundationViolet.violet7,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Icon(Icons.navigate_next_rounded,
                    color: FoundationViolet.violet7,
                    size: 28,
                  )
                ],
              ),
            ],
          ),
        SizedBox(height: 20,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TaglineForumCard(topTag: "MomHope Indonesia", buttomMainTag: "Keluh Kesahkan", buttomSubTag: "Mommy Mental"),
                const SizedBox(width:12),
                TaglineForumCard(topTag: "Sehati", buttomMainTag: "Pendengar", buttomSubTag: "Sehati"),
                const SizedBox(width:12),
                TaglineForumCard(topTag: "MomHope Indonesia", buttomMainTag: "Keluh Kesahkan", buttomSubTag: "Mommy Mental"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}