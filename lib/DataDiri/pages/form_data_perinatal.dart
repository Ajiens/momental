import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/widgets/inputField/date_field.dart';
import 'package:momental/widgets/inputField/radio_field.dart';

import '../../constant/color_pallete.dart';
import '../../constant/validator.dart';

class DataPerinatal extends StatelessWidget {
  const DataPerinatal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 28),
      child: ListView(
        children: [
          RadioInputField(
            isMustFilled: true,
            headerText: Text("Kondisi kehamilan terdekat",
              style: GoogleFonts.poppins(
                color: FoundationViolet.violet13,
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),
            ),
            validator: Validator.atLeastOneitem,
            items: [
              {
                "label": "Hamil",
                "value": 4,
              },
              {
                "label": "Pasca Hamil",
                "value": 10,
              },
            ],
            onChanged: (value, label) {
              print(value);
              print(label);
            },
          ),
          SizedBox(height: 20,),
          DateInputField(
            isMustFilled: true,
            validator: Validator.required,
            value: null,
            headerText: Text("Hari Pertama Haid Terakhir",
              style: GoogleFonts.poppins(
                color: FoundationViolet.violet13,
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),
            ),
            onChanged: (value) {
              print("value: $value");
            },
          ),
          SizedBox(height: 20,),
          
          DateInputField(
            isMustFilled: true,
            validator: Validator.required,
            value: null,
            headerText: Text("Hari Perkiraan lahir",
              style: GoogleFonts.poppins(
                color: FoundationViolet.violet13,
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),
            ),
            onChanged: (value) {
              print("value: $value");
            },
          ),
        ],
      ),
    );
  }
}