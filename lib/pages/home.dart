
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lunch_manu/fonts/gmatket_font_family.dart';
import 'package:lunch_manu/utils/data.dart';
import 'package:lunch_manu/widgets/category_item.dart';
import 'package:lunch_manu/widgets/feature_item.dart';
import 'package:lunch_manu/widgets/popular_item.dart';
import 'package:lunch_manu/fonts/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: const Text("Hello Sangvaleap!", style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.w600, fontFamily: FontFamily.gmarketSansTTFBold),),
                ),
              ),
              //NotificationBox(number: 1,)
          ],),
        ),
        body: SafeArea(child: getBody()),
      );
  }

  getBody(){
    return
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Random Dice", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: FontFamily.gmarketSansTTFMedium),),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              child: listPopulars(),
            ),
            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text("Tag's", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: FontFamily.gmarketSansTTFMedium),),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 0),
              child: listCategories(),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: listFeatured(),
            ),
            SizedBox(height: 20,),
          ],
        ),
      );
  }

  listCategories(){
    List<Widget> lists = List.generate(categories.length, (index) => CategoryItem(data: categories[index]));
    lists.insert(0, CategoryItem(
      data: {
        "name" : "All",
        "icon" : FontAwesomeIcons.th,
      }, 
      seleted: true,)
    );
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 5, left: 15),
        child: Row(
          children: lists
        ),
      );
  }

  listPopulars(){
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15),
        child: Row(
          children: List.generate(populars.length, 
            (index) => PopularItem(data: populars[index])
          ),
        ),
      );
  }

  listFeatured(){
    return
      Column(
        children: List.generate(featured.length, 
          (index) => FeaturedItem(data: featured[index])
        ),
      );
  }
}