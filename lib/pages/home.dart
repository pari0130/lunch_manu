
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/fonts/gmatket_font_family.dart';
import 'package:lunch_manu/widgets/widgets.dart';
import 'package:lunch_manu/fonts/fonts.dart';
import 'package:lunch_manu/models/models.dart';
import 'package:lunch_manu/api/apis.dart';
import 'package:lunch_manu/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<NaverPlaceModel> randomItemList = [];
  final logger = Logger();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    randomItemList = CommonUtils.shuffleAndTake(size: 5, list: (await NaverPlaceApi().search(query: "음식점"))).cast<NaverPlaceModel>();
    // randomItemList?.forEach((element) { logger.d(element.name); });
  }

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
                  margin: EdgeInsets.only(left: 0, right: 15),
                  child: const Text("EAT!!", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600, fontFamily: FontFamily.gmarketSansTTFBold),),
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
                  Text("무작위 음식점은 어때요?", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: FontFamily.gmarketSansTTFMedium),),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              child: listRandom(),
            ),
            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text("Tag 음식점은 어때요?", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: FontFamily.gmarketSansTTFMedium),),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 0),
              child: listCategories(),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: listTags(),
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

  listRandom(){
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15),
        child: Row(
          children: List.generate(randomItemList.length,
            (index) => RandomItem(data: randomItemList[index])
          ),
        ),
      );
  }

  listTags(){
    return
      Column(
        children: List.generate(featured.length, 
          (index) => TagsItem(data: featured[index])
        ),
      );
  }
}