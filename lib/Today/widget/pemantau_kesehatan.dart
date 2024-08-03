import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Assessment/pages/asessment.dart';
import 'package:momental/DataDiri/pages/data_diri.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/state_util.dart';
import 'package:momental/widgets/button.dart';
import 'package:momental/widgets/stepper_container.dart';

class PemantauKesehatan extends StatelessWidget {
  const PemantauKesehatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pemantau Kesehatan",
            style: GoogleFonts.poppins(
              color: Color(0xFF5B506E),
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),
          ),
          SizedBox(height: 8,),
          _faseCard(),
          SizedBox(height: 12,),
          StepperContainer(
            step: 1,
            content: [
              asessmentCard(),
              konselingCard()
            ],
          )
        ],
      ),
    );
  }

  Widget _faseCard(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 24,
                width: 24,
                child: CircleAvatar(
                  backgroundColor: Style.secondary,
                  child: Icon(Icons.near_me_outlined, color: Colors.white,size: 16,), //TACK ICON
                ),
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Fase taking in Postpartum",
                    style: GoogleFonts.poppins(
                      color: FoundationViolet.violet13,
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                    ),
                  ),
                  Text("Sekarang",
                    style: GoogleFonts.poppins(
                      color: FoundationViolet.violet7,
                      fontWeight: FontWeight.w500,
                      fontSize: 10
                    ),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          const Icon(Icons.navigate_next_rounded,
            color: FoundationViolet.violet7,
            size: 20,
          )
        ],
      ),
    );
  }

  Container asessmentCard(){
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Row( //Judul dan SubJudul
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 2),
                      height: 18,
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF47B2FF),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text("Dibuka",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text( "Asesmen Pertama Fase Ini",
                        style: GoogleFonts.poppins(
                          color: FoundationViolet.violet13,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text( "Lakukan asesmen kembali sebagai \ndeteksi awal sebelum konsultasi",
                        style: GoogleFonts.poppins(
                          color: FoundationViolet.violet7,
                          fontWeight: FontWeight.w600,
                          fontSize: 10
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              progressIndicator(2, 3)
            ],
          ),
          SizedBox(height: 12,),
          Container( //Indikasi Status Asessment
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BlueMarguerite.shade100,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Container( // Kalendar Tanggal
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Style.primary,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      Text("APR",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text("15",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8,),
                Column( // Indikasi Status
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Status asesmen sebelumnya",
                      style: GoogleFonts.poppins(
                        color: FoundationViolet.violet7,
                        fontWeight: FontWeight.w600,
                        fontSize: 10 
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        const SizedBox(
                          height: 8,
                          width: 8,
                          child: CircleAvatar(backgroundColor: Style.warning,)
                        ),
                        SizedBox(width: 4,),
                        Text("Anxious",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: FoundationViolet.violet13
                          ),
                        ),
                        Text(" (10%)",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: FoundationViolet.violet7
                          ),
                        ),
                        Text(" | Fase 3 Trimester 3",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: FoundationViolet.violet7
                          ),
                        ),
                      
                      ],
                    )
                  ],
                ),
                Spacer(),
                Icon(Icons.navigate_next_rounded, color: FoundationViolet.violet7,size: 22,)
              ],
            ),
          ),
          SizedBox(height: 12,),
          SizedBox(
            height: 53,
            child: CustomButton(
              label: Text("Mulai",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 14
                ),
              ), 
              color: Style.primary, 
              tapFunction: (){Get.to(Assessment());}),
          )
        ],
      ),
    );
  }

  Widget progressIndicator(int step, int max){
    return SizedBox(
      height: 55,
      width: 55,
      child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$step /$max",
                    style: GoogleFonts.poppins(
                      color: FoundationViolet.violet13,
                      fontWeight: FontWeight.w800,
                      fontSize: 12
                    ),
                  ),
                  Text("Selesai",
                    style: GoogleFonts.poppins(
                      color: FoundationViolet.violet7,
                      fontWeight: FontWeight.w600,
                      fontSize: 10
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: CircularProgressIndicator(
                value: step/max,
                strokeWidth: 6,
                color: Style.primary,
                backgroundColor: FoundationViolet.violet5,
              ),
            ),
          ],
      ),
    );
  }

  Container konselingCard(){
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2),
            height: 18,
            width: 131,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: FoundationViolet.violet6,
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text("Tidak Terindikasi",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text( "Konseling",
              style: GoogleFonts.poppins(
                color: FoundationViolet.violet13,
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text( "Konseling dapat dilakukan setelah terindikasi gejala pada asesmen",
              style: GoogleFonts.poppins(
                color: FoundationViolet.violet7,
                fontWeight: FontWeight.w600,
                fontSize: 10
              ),
            ),
          ),
          SizedBox(height: 12,),
          Container( //Indikasi Status Asessment
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: FoundationRed.light,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/image/gagal-ikut.png"),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFE1E6F), Color(0xFF7B5BF9)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                  ),
                ),
                SizedBox(width: 8,),
                Column( // Indikasi Status
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Konseling Cepat",
                      style: GoogleFonts.poppins(
                        color: Style.warningRed,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),
                    ),
                    Text("Saya benar-benar sedang\nmembutuhkan konseling",
                      style: GoogleFonts.poppins(
                        color: FoundationViolet.violet7,
                        fontWeight: FontWeight.w600,
                        fontSize: 10 
                      ),
                    )
                  ]
                ),
                Spacer(),
                Icon(Icons.navigate_next_rounded, color: FoundationViolet.violet7,size: 22,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


