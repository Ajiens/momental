import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/DataDiri/controller/data_perinatal_controller.dart';
import 'package:momental/widgets/inputField/date_field.dart';
import 'package:momental/widgets/inputField/radio_field.dart';

import '../../constant/color_pallete.dart';
import '../../constant/validator.dart';

class DataPerinatal extends StatelessWidget {
  final DataPerinatalController controller;

  const DataPerinatal({
    required this.controller,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 28, 22, 80),
        child: ListView(
          children: [
            RadioInputField(
              isMustFilled: true,
              value: controller.kondisiKehamilan,
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
                controller.kondisiKehamilan = label;
              },
            ),
            SizedBox(height: 20,),
            DateInputField(
              isMustFilled: true,
              validator: Validator.required,
              value: controller.hpht,
              headerText: Text("Hari Pertama Haid Terakhir",
                style: GoogleFonts.poppins(
                  color: FoundationViolet.violet13,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),
              ),
              onChanged: (value) {
                controller.hpht = value;
              },
            ),
            SizedBox(height: 20,),
            
            DateInputField(
              isMustFilled: true,
              validator: Validator.required,
              value: controller.hpl,
              headerText: Text("Hari Perkiraan lahir",
                style: GoogleFonts.poppins(
                  color: FoundationViolet.violet13,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),
              ),
              onChanged: (value) {
                controller.hpl = value;
              },
            ),
            // SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}