import 'package:flutter/material.dart';
import 'package:momental/Today/widget/daily_insight.dart';
import 'package:momental/Today/widget/informasi.dart';
import 'package:momental/Today/widget/pemantau_kesehatan.dart';
import 'package:momental/Today/widget/pilih_masa.dart';
import 'package:momental/Today/widget/profile_today.dart';
import 'package:momental/Today/widget/tanggal.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/state_util.dart';

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                appBar(),
                body()
              ],
            ),
          ),
        
      ),
    );
  }

  Widget appBar(){
    print(MediaQuery.of(Get.currentContext).size.height * 0.4);
    return Container(
      height: 295,
      decoration: BoxDecoration(
        color: BlueMarguerite.shade600,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            SizedBox(height: 16,),
            PilihMasaPerinatal(
              contentItems: [
                {
                  "kehamilan": 1,
                  "hphl": "30 Maret 2022",
                  "hpht": "30 Januari 2023"
                },
                {
                  "kehamilan": 2,
                  "hphl": "30 Maret 2023",
                  "hpht": "30 Januari 2024"
                }
              ],
              onChanged: (value, label){}
            ),
            SizedBox(height: 12,),
            ProfileToday(),
            SizedBox(height: 12,),
            Tanggal(),
          ],
        ),
      ),
    );
  }

  Widget body(){
    return Container(
      color: Color(0xFFF1F1F3),
      padding: EdgeInsets.all(28),
      child: const Column(
        children: [
          DailyInsight(
            content: [
              {
                "title": "Can i be a good mother?",
                "background-color": Style.primary,
                "image-decoration": "assets/image/orang-sedih.png"
              },
              {
                "title": "Keterkaitan Hormon dan Insomnia",
                "background-color": Style.primary,
                "image-decoration": "assets/image/orang-sedih.png"
              },
              {
                "title": "Why i'm not pretty after birth?",
                "background-color": Style.primary,
                "image-decoration": "assets/image/gagal-ikut.png"
              },
              {
                "title": "Keterkaitan Hormon dan Insomnia",
                "background-color": Style.primary,
                "image-decoration": "assets/image/gagal-ikut.png"
              },
            ] 
          ),
          const SizedBox(height: 24,),
          InformasiToday(
            content: [
              {
                "title": "Peta Perinatal",
                "image-title": "assets/image/peta.png"
              },
              {
                "title": "Gangguan Mental Perinatal",
                "image-title": "assets/image/pusing.png"
              },
              {
                "title": "Motivasi Hari Ini",
                "image-title": "assets/image/a-to-z.png"
              },
              {
                "title":  "BPJS & Faskes",
                "image-title": "assets/image/bpjs.png"
              },
              {
                "title": "Edukasi Ibu Hamil",
                "image-title": "assets/image/a-to-z.png"
              },
            ] 
          ),
          SizedBox(height: 24,),
          PemantauKesehatan()
        ],
      ),
    );
  }
}