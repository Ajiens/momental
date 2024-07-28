import 'package:flutter/material.dart';

import '../constant/color_pallete.dart';

class StepperContainer extends StatelessWidget {
  final List<Container> content;
  final int step;
  
  const StepperContainer({
    required this.content,
    required this.step,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (int i = 0; i< content.length; i++)
          _stepperContainer(content[i], i+1)
        ],
      ),
    );
  }

  
  Widget _stepperContainer(Container content, int index){
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned( // Garis vertikal
          left: 6,
          top: 0,
          bottom: 0,
          child: Container(
            width: 3,
            color: (index <= step)?Style.primary: FoundationViolet.violet6,
          ),
        ),
        Align( // Lingkaran di tengah garis
          alignment: Alignment.centerLeft,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              border: Border.all(
                width:4, 
                color: (index <= step)?Style.primary: FoundationViolet.violet6
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Kontainer utama
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, bottom: 6, top: 6),
            child: content,
          ),
        )

        // Container(
        //   margin: EdgeInsets.only(left: 30),
        //   height: 100,
        //   decoration: BoxDecoration(
        //     color: Colors.amber,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Center(
        //     child: Text(
        //       'Container di sini',
        //       style: TextStyle(color: Colors.black),
        //     ),
        //   ),
        // ),
      
      ],
    );
  }
}