import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/widgets/micro_component.dart';

class ProfileToday extends StatelessWidget {
  const ProfileToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          profilePicture('assets/image/alwan.jpg', size: 40),
          _today(),
          _suffixIcon()
        ],
      ),
    );
  }

  Widget _today(){
    return Column(
      children: [
        Text("Hari ini",
          style: GoogleFonts.poppins(
            color: BlueMarguerite.shade300,
            fontWeight: FontWeight.w600,
            fontSize: 12
          ),
        ),
        SizedBox(height: 4,),
        Text(DateFormat("d MMM y").format(DateTime.now()),
          style: GoogleFonts.poppins(
            color: BlueMarguerite.shade50,
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),
        ),
        SizedBox(height: 4,),
        Text("Hari Nifas ke-1",
          style: GoogleFonts.poppins(
            color: BlueMarguerite.shade300,
            fontWeight: FontWeight.w600,
            fontSize: 12
          ),
        ),
      ],
    );
  }

  Widget _suffixIcon(){
    return const Row(
      children: [
        Icon(Icons.calendar_today_rounded,
          color: FoundationViolet.violet1,
          size: 22,
        ),
        SizedBox(width: 8,),
        Icon(Icons.notifications,
          color: FoundationViolet.violet1,
          size: 22,
        ),
      ],
    );
  }
}