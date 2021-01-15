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
      HomeScreen(),
      MyCockScreen(),
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
                      image: AssetImage("assets/images/drawerheader.png"),
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
                        style: TextStyle(fontSize: 14, color: kBodyTextColor),
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
                        style: TextStyle(fontSize: 14, color: kBodyTextColor),
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
                        style: TextStyle(fontSize: 14, color: kBodyTextColor),
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
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(
            Icons.menu,
            color: kActiveColor,
          ),
        ),
      ),
      title: Text("hellocock",
          style: TextStyle(color: kActiveColor, fontFamily: 'NotoSans')),
      actions: [
        IconButton(
            icon: Icon(Icons.exit_to_app),
            color: kActiveColor,
            onPressed: () {
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
