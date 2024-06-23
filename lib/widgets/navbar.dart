import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Forum/pages/forum.dart';
import 'package:momental/theme/color_pallete.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
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
    final media = MediaQuery.of(context);
    const duration = Duration(milliseconds: 300);
    
    return MaterialApp(
      home: Scaffold(  
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: buttomNavbar(),
        body:
          PageView(
            controller: _pageController,
            onPageChanged: (index){
              setState(() {
                currentIndex = index;
              });
            },

            // Tempat naruh semua halaman()
            children: [
              Forum(),
              Icon(
                Icons.call,
                size: 150,
              ),
              Icon(
                Icons.camera,
                size: 150,
              ),
              Icon(
                Icons.chat,
                size: 150,
              ),
            ],
            
          ),
        )
      );
    // );
  }

  BottomNavigationBar buttomNavbar(){
    return BottomNavigationBar(
      iconSize: 30,
      currentIndex: currentIndex,
      onTap: _onTappedItem,

      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: BlueMarguerite.shade600,
      unselectedItemColor: FoundationViolet.violet5,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/svg/calendar.svg",),
          activeIcon: SvgPicture.asset("assets/svg/calendar_active.svg",),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/svg/daily.svg",),
          activeIcon: SvgPicture.asset("assets/svg/daily_active.svg",),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/svg/2friends.svg",),
          activeIcon: SvgPicture.asset("assets/svg/2friends_active.svg",),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/svg/profile.svg",),
          activeIcon: SvgPicture.asset("assets/svg/profile_active.svg",),
          label: ""
        ),
      ]
    );
  }

  void _onTappedItem(int value) {
    setState(() {
      currentIndex = value;
    });
    _pageController.jumpToPage(value);
    }

}