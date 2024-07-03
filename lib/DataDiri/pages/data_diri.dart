import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/widgets/button.dart';

class DataDiri extends StatefulWidget {
  const DataDiri({super.key});

  @override
  State<DataDiri> createState() => _DataDiriState();
}

class _DataDiriState extends State<DataDiri> {
  late PageController _pageController;
  late int maxPage;
  int step = 0;

  List<Widget> page = [
    ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 300,
            color: Colors.indigo,
          ),
          Container(
            height: 400,
            color: Colors.transparent,
          ),
        ],
      ),
    
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.cyan,
    ),
    Container(
      color: Colors.greenAccent,
    )
  ];

  @override
  void initState(){
    _pageController = PageController(initialPage: 0);
    maxPage = page.length;
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: headerAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: butomButton(),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: page
        )
      ),
    );
  }

  PreferredSize headerAppBar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(120),
      child: Container(
        color: FoundationViolet.violet1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new_rounded, 
                      color: FoundationViolet.violet7,
                    )
                    ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Data Perinatal",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: FoundationViolet.violet13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              customStepper(),
            ],
          ),
        ),
      ),
    );
  }

  Widget butomButton(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          if (step != 0)
          Expanded(
            child:Padding(
            padding: const EdgeInsets.only(right: 12),
              child: CustomButton(
                label: Text("Kembali",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 14
                  ),
                ), 
                color: Style.secondary, 
                tapFunction: (){
                  if (step > 0) {
                    setState(() {
                      step--;
                      _pageController.jumpToPage(step);
                    });    
                  }
                }
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              label: Text("Lanjutkan",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 14
                ),
              ), 
              color: Style.primary, 
              tapFunction: (){
                if (step < maxPage-1) {
                  setState(() {
                    step++;
                    _pageController.jumpToPage(step);
                  });
                }
              }
            ),
          ),
        ],
      ),
    );
  }

  Widget customStepper(){
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.5),
              color: FoundationBlue.dark,
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < maxPage; i++)
                Expanded(
                  child: Row(
                    children: [
                      if (i < step) // Showing filled part
                          Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 12,
                            decoration: const BoxDecoration(
                              color:BlueMarguerite.shade500,
                              border: const Border.symmetric(
                                horizontal: BorderSide(
                                  color: BlueMarguerite.shade300,
                                  width: 3,
                                  style: BorderStyle.solid
                                )
                              )
                            ),
                          )
                        ),
                      if (i == step) // Showing current step
                        Expanded(child:circleStepper(i + 1)),
                      if (i > step) // Showing empty part
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 12,
                            color: Colors.transparent,
                          )
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget circleStepper(int index) {
    return Row(
      children: [
        if (index == maxPage)
         Expanded(
          child: Container(
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(22)),
              color:BlueMarguerite.shade500,
              border: const Border.symmetric(
                horizontal: BorderSide(
                  color: BlueMarguerite.shade300,
                  width: 3,
                  style: BorderStyle.solid
                )
              )
            ),
          )
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.5),
            border: Border.all(
              color: BlueMarguerite.shade300,
              width: 3,
              style: BorderStyle.solid
            )
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:BlueMarguerite.shade500
            ),
          )
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.5),
            border: Border.all(
              color: BlueMarguerite.shade300,
              width: 4,
              style: BorderStyle.solid
            )
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:BlueMarguerite.shade500
            ),
            child:Text('${index}',
              style: GoogleFonts.poppins(
                fontSize: 16, 
                color: Colors.white,
                fontWeight: FontWeight.w600
              )
            ),
          ),
        ),
      ],
    );
  }
}