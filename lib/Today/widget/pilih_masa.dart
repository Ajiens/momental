import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/DataDiri/pages/data_diri.dart';
import 'package:momental/state_util.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../constant/color_pallete.dart';

class PilihMasaPerinatal extends StatefulWidget {
  const PilihMasaPerinatal({
    required this.contentItems,
    required this.onChanged,
    this.value,
    super.key,
  });

  final List<Map<String, dynamic>> contentItems;
  final String? value;
  final Function(dynamic value, String? label) onChanged;

  @override
  State<PilihMasaPerinatal> createState() => _QDropdownFieldState();
}

// Contoh dummy contentItems:
/* {
  "kehamilan": 1
  "hphl": "30 Maret 2022"
  "hpht": "30 Januari 2024"
}*/
class _QDropdownFieldState extends State<PilihMasaPerinatal> {
  List<Map<String, dynamic>> items = [];
  late Map<String, dynamic> selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.contentItems[0]; // Default nya adalah indeks 0
    items = [];

    for (final item in widget.contentItems) {
      items.add(item);
      if (item['value'] == widget.value){
        selectedValue = item;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => modalBottom(),
      child: Container(
        decoration: BoxDecoration(
          color: Style.primary,
          borderRadius: BorderRadiusDirectional.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              contentPeriNatal(selectedValue, false),
              Spacer(),
              Icon(Icons.keyboard_arrow_down_outlined,
                size: 20,
                color: Colors.white,
              )
            ],
          ),
        )
      ),
    );
  
  }

  Future modalBottom(){
    print(items);
    return showModalBottomSheet(
      context: Get.currentContext,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 320,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 20, 28, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text("Pilih Masa Perinatal",
                textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color: FoundationViolet.violet13,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: FoundationViolet.violet5,
                ),
                SizedBox(height: 10,),
                Container(
                  height: 165,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < items.length; i++)
                          GestureDetector(
                            onTap: (){
                              selectedValue = items[i];
                              setState(() {});
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FoundationViolet.violet3,
                                  borderRadius: BorderRadiusDirectional.circular(24),
                                  border: (selectedValue == items[i])
                                    ? Border.all(color: FoundationRed.light_active, width: 6)
                                    : Border.all(color: Colors.transparent, width: 6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                  child: Row(
                                    children: [
                                      contentPeriNatal(items[i], true),
                                      Spacer(),
                                    ],
                                  ),
                                )
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.to(DataDiri());
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: DashedBorder.fromBorderSide(
                                      dashLength: 5, side: BorderSide(color: Colors.black, width: 1)),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FoundationRed.normal,
                                        borderRadius: BorderRadius.circular(4)
                                      ),
                                      height: 14,
                                      width: 14,
                                      child: Icon(Icons.add_outlined, color: Colors.white, size: 10,),
                                    ),
                                    SizedBox(width: 12,),
                                    Text("Tambah Data",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: FoundationViolet.violet10
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ),
                          ),
                        SizedBox(height: 12,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget contentPeriNatal(Map<String, dynamic> data, bool isBlack){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kehamilan ke-${data['kehamilan']}",
          style: GoogleFonts.poppins(
            color: (isBlack) ? FoundationViolet.violet10 :Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 14
          ),
        ),
        Text("HPHL ${data['hphl']}",
          style: GoogleFonts.poppins(
            color: (isBlack) ? FoundationViolet.violet7 : BlueMarguerite.shade300,
            fontWeight: FontWeight.w500,
            fontSize: 12
          ),
        ),
        Text("HPHT ${data['hpht']}",
          style: GoogleFonts.poppins(
            color: (isBlack) ? FoundationViolet.violet7 : BlueMarguerite.shade300,
            fontWeight: FontWeight.w500,
            fontSize: 12
          ),
        )
      ],
    );
  }
}
