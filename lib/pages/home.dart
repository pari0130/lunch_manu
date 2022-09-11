
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/fonts/gmatket_font_family.dart';
import 'package:lunch_manu/widgets/widgets.dart';
import 'package:lunch_manu/fonts/fonts.dart';
import 'package:lunch_manu/models/models.dart';
import 'package:lunch_manu/api/apis.dart';
import 'package:lunch_manu/utils/utils.dart';
import 'package:lunch_manu/status/status.dart';
import 'package:lunch_manu/widgets/custom_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<NaverPlaceModel> randomItemList = [];
  final logger = Logger();
  final LoadingStatus status = Get.put(LoadingStatus());

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    status.updateMainLoading(true);
    randomItemList = CommonUtils.shuffleAndTake(size: 5, list: (await NaverPlaceApi().search(query: "음식점"))).cast<NaverPlaceModel>();
    // randomItemList?.forEach((element) { logger.d(element.name); });
    status.updateMainLoading(false);
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
                  margin: const EdgeInsets.only(left: 0, right: 15),
                  child: const Text("EAT!!", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600, fontFamily: gmarketSansTTFBold),),
                ),
              ),
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
            const SizedBox(height: 25,),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("무작위 음식점은 어때요?", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: gmarketSansTTFMedium),),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              child: Obx(() => status.isMainLoading.isTrue ? CustomLoading() : listRandom()),
              // CustomLoading(),
            ),
            const SizedBox(height: 25,),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: const Text("Tag 음식점은 어때요?", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: gmarketSansTTFMedium),),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 0),
              child: listCategories(),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: listTags(),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      );
  }

  listCategories(){
    List<Widget> lists = List.generate(categories.length, (index) => CategoryItem(data: categories[index]));
    lists.insert(0, CategoryItem(
      data: const {
        "name" : "All",
        "icon" : FontAwesomeIcons.th,
      }, 
      seleted: true,)
    );
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(bottom: 5, left: 15),
        child: Row(
          children: lists
        ),
      );
  }

  listRandom(){
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
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