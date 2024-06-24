import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Forum/pages/forum.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/Authentication/widget/register.dart';
import 'package:momental/widgets/button.dart';
import 'package:momental/widgets/input_field.dart';

import 'package:momental/widgets/navbar.dart';

class ButtonPlaceholder extends StatelessWidget {
  final BuildContext contextBefore;

  ButtonPlaceholder({
    Key? key,
    required this.contextBefore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          children: [
            SizedBox(height: 30,),
            CustomButton(
              icon: const Icon(Icons.g_mobiledata, color: Colors.white,),
              label: Text("Mulai dengan Google",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              color: Style.primary,
              tapFunction: (){},
            ),
            SizedBox(height: 8,),
            CustomButton(
              icon: const Icon(Icons.phone_rounded, color: Colors.white,),
              label: Text("Mulai dengan Nomor Telepon",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              color: Style.secondary,
              tapFunction: (){
                modalBottom(context);
              },
            ),
            SizedBox(height: 8,),
            CustomButton(
              icon: const Icon(Icons.person_2_rounded, color: Colors.white,), 
              label: Text("Mulai sebaga Tamu",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              color:FoundationViolet.violet9,
              tapFunction: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => Navbar()),
                                    ),
            ),
            SizedBox(height: 8,),
          ],
        )
      )
    );
  }

  Future modalBottom(BuildContext context){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 274,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 28, 40),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 8,
                    width: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: FoundationViolet.violet5,
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                CustomInputField(
                  isMustFilled: true,
                  inputType: TextInputType.phone,
                  headerIcon: const Icon(
                    Icons.phone,
                    size: 20,
                    color: Style.secondary,
                  ),
                  headerText: Text("Nomor Telepon",
                    style: GoogleFonts.poppins(
                      color: FoundationViolet.violet13,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  prefix: Text(" +62  |  "),
                ),
                Spacer(),
                CustomButton(
                  label: Text("Lanjutkan",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16
                    ),
                  ),
                  color: Style.primary, //TODO: Berubah warna kalau antara text controller kosong/keisi 
                  tapFunction: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  }
                ),
              ]
            ),
          )
        ),
      )
    );
  }
}
