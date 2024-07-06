import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/widgets/button.dart';

import '../../constant/color_pallete.dart';
import '../../constant/validator.dart';
import '../../widgets/inputField/drop_down_field.dart';
import '../../widgets/inputField/text_field.dart';

class KartuIdentias extends StatelessWidget {
  const KartuIdentias({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 28),
      child: ListView(
        children: [
          DropDownInputField(
            inputSugest: "Pilih Jenis Identitas",
            isMustFilled: true,
            headerText: Text("Jenis Kartu Identitas",
              style: GoogleFonts.poppins(
                color: FoundationViolet.violet13,
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),
            ),
            validator: Validator.required,
            headerIcon:  const Icon(
              Icons.credit_card,
              size: 20,
              color: Style.secondary,
            ),
            items: [
              {
                "label": "Kartu Tanda Penduduk",
                "value": "KTP",
              },
              {
                "label": "Kartu BPJS",
                "value": "BPJS",
              },
              {
                "label": "Kartu KIS",
                "value": "KIS",
              }
            ],
            onChanged: (value, label) {
              print("$value +++++ $label");
            },
          ),
          
            SizedBox(height: 40,),
            CustomTextInputField(
              maxLength: 20,
              isMustFilled: true,
              inputType: TextInputType.number,
              fillColor: FoundationViolet.violet1,
              validator: Validator.number,
              hintText: "Masukkan nomor kartu",
              headerIcon:  const Icon(
                Icons.credit_card,
                size: 20,
                color: Style.secondary,
              ),
              headerText: Text("Nomor Kartu",
                style: GoogleFonts.poppins(
                  color: FoundationViolet.violet13,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),
              ),
              suffix: Container(
                alignment: Alignment.center,
                width: 63,
                margin: EdgeInsetsDirectional.symmetric(vertical: 6, horizontal: 12),
                child: Text("Cari",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                  ),
                ),
                decoration: BoxDecoration(
                  color: Style.primary,
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              onChanged: (value){
                print(value);
              },
            ),
        ],
      )
    );
  }
}