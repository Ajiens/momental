import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:momental/constant/color_pallete.dart';


class Tanggal extends StatelessWidget {
  const Tanggal({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, DateTime> tanggal = getDatesOfCurrentWeek();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tanggal.entries.map((entry) {
          return tanggalCard(entry.key, entry.value);
        }).toList()
      )
    );
  }

  Widget tanggalCard(String day, DateTime tanggal){
    if (DateFormat("d-MMM-y").format(tanggal) != DateFormat("d-MMM-y").format(DateTime.now())){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day,
            style: GoogleFonts.poppins(
              color: BlueMarguerite.shade200,
              fontSize: 12,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 8,),
          Text(DateFormat("d").format(tanggal),
            style: GoogleFonts.poppins(
              color: BlueMarguerite.shade200,
              fontSize: 12,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      );
    }
    else{
      return Container(
        width: 61,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.1),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("$day",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 8,),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Style.secondary,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(DateFormat("d").format(tanggal),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  Map<String, DateTime> getDatesOfCurrentWeek() {
    List<String> daysOfWeek = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];

    // Get the current date
    DateTime now = DateTime.now();

    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));

    Map<String, DateTime> datesMap = {};
    
    for (int i = 0; i < daysOfWeek.length; i++) {
      datesMap[daysOfWeek[i]] = firstDayOfWeek.add(Duration(days: i));
    }
    return datesMap;
  }
}