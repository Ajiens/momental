import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/state_util.dart';

showToast({
  required String type,
  String? message,
  int? duration,
}) async {
  // Menampilkan dialog toast
  showDialog<void>(
    context: globalContext,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTapDown: (e) => hideToast(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: _colorSelected(type),
                    spreadRadius: 0,
                    blurRadius: 18,
                    offset: Offset(0, 11), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // ICON
                    Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        _iconSelected(type),
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: _colorSelected(type),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(width: 12),

                    // MESSAGES
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _titleSelected(type),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            message ?? 'There is something wrong',
                            maxLines: 2,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),

                    GestureDetector(
                      onTap: () => hideToast(),
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );

  // Menunda selama 3 detik sebelum menghilangkan toast
  await Future.delayed(Duration(seconds: duration ?? 5));
  hideToast();
}

IconData _iconSelected(String type) {
  if (type.toLowerCase() == "success") {
    return Icons.check_sharp;
  } else if (type.toLowerCase() == "warning") {
    return Icons.warning_amber_rounded;
  } else if (type.toLowerCase() == "information") {
    return Icons.info_outline_rounded;
  } else if (type.toLowerCase() == "error") {
    return Icons.block_outlined;
  }
  return Icons.block_outlined;
}

Color _colorSelected(String type) {
  if (type.toLowerCase() == "success") {
    return Color(0xFF7ED3AF);
  } else if (type.toLowerCase() == "warning") {
    return Color(0xFFF0CCA3);
  } else if (type.toLowerCase() == "information") {
    return Color(0xFF9AB1F4);
  } else if (type.toLowerCase() == "error") {
    return Color(0xFFEEA197);
  }
  return Color(0xFFEEA197);
}

String _titleSelected(String type) {
  if (type.toLowerCase() == "success") {
    return "Success";
  } else if (type.toLowerCase() == "warning") {
    return "Warning";
  } else if (type.toLowerCase() == "information") {
    return "Information";
  } else if (type.toLowerCase() == "error") {
    return "Error";
  }
  return "Error";
}
hideToast() async {
  Get.back();
}
