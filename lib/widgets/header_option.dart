import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:momental/constant/color_pallete.dart';
class HeaderApp extends StatefulWidget {
  final Widget leftCorner;
  final bool withOption;
  final Widget? rightCorner;
  final List<Widget>? optionWidgetInterface;
  final List<Widget>? pageContent;

  HeaderApp({
    Key? key,
    required this.leftCorner,
    required this.withOption,
    this.rightCorner,
    this.optionWidgetInterface,
    this.pageContent,
  }) : super(key: key);

  @override
  State<HeaderApp> createState() => _HeaderAppState();

}

class _HeaderAppState extends State<HeaderApp> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState(){
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoundationViolet.violet3,
      appBar: PreferredSize(
        preferredSize: (widget.withOption)? Size.fromHeight(MediaQuery.of(context).size.height*.21): Size.fromHeight(MediaQuery.of(context).size.height*.125),
        child: Container(
          color: BlueMarguerite.shade700,
          padding: EdgeInsets.fromLTRB(24, 40, 24, 20),
          child: Column(
            children: [
              Row(
                children: [
                  widget.leftCorner,
                  Spacer(),
                  if (widget.rightCorner != null) widget.rightCorner!,
                ],
              ),
              SizedBox(height: 14,),
              if (widget.withOption && widget.optionWidgetInterface != null)...[
                tabOption()
              ],
            ],
          )
        ),
      ),
      body:PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        children: widget.pageContent ?? [],
      ),
    );
  }

  Container tabOption(){
    return Container(
      height: 61,
      decoration: BoxDecoration(
        color: BlueMarguerite.shade600,
        borderRadius: BorderRadius.all(Radius.circular(24))
      ),
      child: Padding(padding: EdgeInsets.all(4),
        child: Row(
          children: 
            List.generate(widget.optionWidgetInterface?.length ?? 0, (index){ //Generate item
              return Expanded(
                child: GestureDetector(
                  onTap:() {
                    setState(() { //Untuk pindah page
                      _pageController.jumpToPage(index);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration( //Untuk button selected
                      color: (currentIndex == index)?FoundationRed.normal: null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: widget.optionWidgetInterface![index]
                  ),
                )
              );
            }),
        )
      )
    );
  }
}


// Contoh Pemakaian (Copas Aja):
// HeaderApp(
//       withOption: true,
//       optionWidgetInterface: [
//         Text("Opsi Page 1",
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: FoundationViolet.violet1
//             ),
//           ),
//         Text("Opsi Page 2",
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: FoundationViolet.violet1
//             ),
//           )
//       ],
//       pageContent: [
//         Container(color: Colors.amber,),
//         Container(color: Colors.blueGrey,)
//       ],
//       leftCorner: Row(
//         children: [
//           SvgPicture.asset(
//             "assets/svg/2friends.svg"
//           ),
//           SizedBox(width: 12,),
//           Text("Komunitas",
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: FoundationViolet.violet1
//             ),
//           )
//         ],
//       ),
//       rightCorner: Row(
//         children: [
//           Text("Lihat semua",
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 14,
//               color: BlueMarguerite.shade400
//             ),
//           ),
//           SizedBox(width: 4,),
//           GestureDetector(
//             onTap: (){},
//             child: Icon(Icons.arrow_forward_ios_outlined,
//               size: 20,
//               color: BlueMarguerite.shade400,
//             ),
//           )
//         ],
//       )
//     );