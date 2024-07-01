import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Authentication/pages/login.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/Authentication/pages/register.dart';
import 'package:momental/widgets/button.dart';

import 'package:momental/widgets/navbar.dart';

import '../../state_util.dart';

class ButtonPlaceholder extends StatelessWidget {

  ButtonPlaceholder({
    Key? key,
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
              // icon: const Icon(Icons.g_mobiledata, color: Colors.white,),
              label: Text("Login",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              color: Style.primary,
              tapFunction: (){
                modalBottom();},
            ),
            SizedBox(height: 8,),
            CustomButton(
              // icon: const Icon(Icons.phone_rounded, color: Colors.white,),
              label: Text("Register",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              color: Style.secondary,
              tapFunction: (){
                Navigator.push(Get.currentContext,
                    MaterialPageRoute(builder: (context) => Register()));
              },
            ),
            SizedBox(height: 8,),
            CustomButton(
              // icon: const Icon(Icons.person_2_rounded, color: Colors.white,), 
              label: Text("Mulai sebaga Tamu",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              color:FoundationViolet.violet9,
              tapFunction: () => Navigator.pushReplacement(
                                        Get.currentContext,
                                        MaterialPageRoute(builder: (context) => Navbar()),
                                    ),
            ),
            SizedBox(height: 8,),
          ],
        )
      )
    );
  }

  Future modalBottom(){
    return showModalBottomSheet(
      context: Get.currentContext,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))
          ),
          child: Login()
        ),
      )
    );
  }
}
