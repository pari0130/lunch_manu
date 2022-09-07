
import 'package:flutter/material.dart';
import 'package:lunch_manu/theme/color.dart';
import 'package:lunch_manu/widgets/bottombar_item.dart';
import 'home.dart';

class RootApp extends StatefulWidget {
  const RootApp({ Key? key }) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  List<IconData> tapIcons = [
    Icons.home_rounded, Icons.favorite
  ];
  List<Widget> pages = [
    HomePage(), HomePage(), HomePage(), HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return goHome();
  }

  goHome() {
    return Scaffold(
      backgroundColor: appBgColor,
      bottomNavigationBar: getBottomBar(),
      body: getBarPage()
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 60, width: double.infinity,
      decoration: BoxDecoration(
        color: bottomBarColor,
        border: Border.all(
          width: 0.5,
          color: Colors.black12
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5)
        ), 
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: .5,
            spreadRadius: .5,
            offset: Offset(0, 1)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
          List.generate(tapIcons.length, 
            (index) => BottomBarItem(tapIcons[index], "", isActive: activeTab == index, activeColor: primary,
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
            )
          )
        ),
    );
  }

  Widget getBarPage(){
    return 
      IndexedStack(
        index: activeTab,
        children: 
          List.generate(tapIcons.length, 
            (index) => pages[index]
          )
      );
  }
}