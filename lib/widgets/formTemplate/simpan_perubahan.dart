import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/state_util.dart';
import 'package:momental/widgets/button.dart';

showSimpanPerubahan({
  required Widget nextPage,
  String? subtitle
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: true,
    builder: (BuildContext context){
      return Container(
        color: Color.fromRGBO(26, 15, 57, 0.4),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 142,
                      decoration: BoxDecoration(
                        color: BlueMarguerite.shade100,
                        borderRadius: BorderRadiusDirectional.circular(24)
                      ),
                      child: Container(
                        child: Image.asset("assets/image/dialog_message.png"),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Text("Simpan Perubahan?",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: FoundationViolet.violet13
                      ),
                    ),
                    SizedBox(height: 12,),
                    Text("Semua input yang Anda masukan akan tersimpan.",
                      maxLines: 5,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: FoundationViolet.violet7
                      ),
                    ),
                    SizedBox(height: 12,),
                    SizedBox(
                      height: 53,
                      child: CustomButton(
                        label: Text("Ya, Simpan",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14
                          ),
                        ),
                        color: Style.primary, 
                        tapFunction: (){
                          Get.to(nextPage);
                        }
                      ),
                    ),
                    SizedBox(height: 12,),
                    SizedBox(
                      height: 53,
                      child: CustomButton(
                        label: Text("Sebentar, Cek Lagi",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14
                          ),
                        ),
                        color: Style.secondary, 
                        tapFunction: (){Get.back();}
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ),
      );
    }
  );
}
