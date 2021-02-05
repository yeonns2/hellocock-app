import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hellocock/screens/home/home_screen.dart';
import 'package:hellocock/screens/inquiry/inquiry_screen.dart';
import 'package:hellocock/screens/manual/manual_screen.dart';
import 'package:hellocock/screens/mycock/mycock_screen.dart';
import 'package:hellocock/screens/notice/notice_screen.dart';
import 'package:hellocock/screens/profile/profile_screen.dart';
import '../size_config.dart';
import '../constants.dart';

class BottomNavBar extends StatefulWidget {
  final User user;
  BottomNavBar(this.user);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  List<Map<String, dynamic>> _navitems = [
    {"icon": "assets/icons/home.svg", "title": "Home"},
    {"icon": "assets/icons/mycock.svg", "title": "My cock"},
    {"icon": "assets/icons/profile.svg", "title": "Profile"},
  ];

  List<Widget> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(widget.user),
      MyCockScreen(widget.user),
      ProfileScreen(widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: SizedBox(
        width: 226,
        child: Drawer(
          elevation: 10.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 246,
                child: DrawerHeader(
                  child: null,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/imyourcocktail.png"),
                    ),
                  ),
                ),
              ),
              VerticalSpacing(of: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoticeScreen(),
                        ),
                      ),
                      child: Text(
                        "- 공지사항",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 15,
                            color: kBodyTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    VerticalSpacing(of: 20),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InquiryScreen(),
                        ),
                      ),
                      child: Text(
                        "- 1:1 문의 ",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 15,
                            color: kBodyTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    VerticalSpacing(of: 20),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManualScreen(),
                        ),
                      ),
                      child: Text(
                        "- 이용방법",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 15,
                            color: kBodyTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: kActiveColor,
        selectedItemColor: kActiveColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: List.generate(
          _navitems.length,
          (index) => BottomNavigationBarItem(
            icon: buildSvgIcon(
                src: _navitems[index]['icon'],
                isActive: _selectedIndex == index),
            label: _navitems[index]["title"],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.4,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(
            Icons.menu,
            color: kActiveColor,
          ),
        ),
      ),
      title: SvgPicture.asset("assets/icons/hellocock_title.svg"),
      actions: [
        if (_selectedIndex == 2)
          IconButton(
              icon: SvgPicture.asset("assets/icons/signout.svg"),
              color: kActiveColor,
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                _googleSignIn.signOut();
              })
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  SvgPicture buildSvgIcon({@required String src, bool isActive = false}) {
    return SvgPicture.asset(
      src,
      height: 20,
      width: 20,
      color: kActiveColor,
    );
  }
}
