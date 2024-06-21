import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/theme/color_pallete.dart';

class VoteBar extends StatelessWidget {
  final double percentage;
  final String label;

  VoteBar({
    required this.percentage,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center ,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: BlueMarguerite.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: percentage / 100,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: Style.poll,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: BlueMarguerite.shade600
                          ),
                          child: Text(
                            '${percentage.toInt()}%',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 6,),
                        Text(
                          label,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}