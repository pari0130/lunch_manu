
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/fonts/gmatket_font_family.dart';
import 'package:lunch_manu/theme/color.dart';
import 'package:lunch_manu/widgets/widgets.dart';
import 'package:lunch_manu/fonts/fonts.dart';
import 'package:lunch_manu/utils/utils.dart';
import 'package:lunch_manu/status/status.dart';
import 'package:lunch_manu/widgets/custom_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List<NaverPlaceModel> randomItemList = [];
  final logger = Logger();
  final LoadingStatus loadingStatus = Get.put(LoadingStatus());
  final TagsPlaceStatus tagsStatus = Get.put(TagsPlaceStatus());
  final RandomPlaceStatus randomStatus = Get.put(RandomPlaceStatus());

  @override
  void initState() {
    getData();
    //CacheUtil.saveJsonFile();
    super.initState();
  }

  Future getData() async {
    randomStatus.updateItem();
    tagsStatus.updateTag(tagsStatus.selectedTag.value);
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
                  child: const Text("FOOD DICE", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600, fontFamily: gmarketSansTTFBold),),
                ),
              ),
          ],),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => getData(),
            color: primary,
            child: getBody(),
          ),
        )
        // body: SafeArea(child: getBody()),
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
              child: Obx(() => loadingStatus.isMainLoading.value ? const CustomLoading() : listRandom()),
            ),
            const SizedBox(height: 25,),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: const Text("태그 음식점은 어때요?", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: gmarketSansTTFMedium),),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 0),
              child: listCategories(),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Obx(() => loadingStatus.isTagLoading.value ? const CustomLoading() : listTags()),
              //child: listTags(),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      );
  }

  listCategories(){
    List<Widget> lists = List.generate(categories.length, (index) => CategoryItem(data: categories[index]));
    /*lists.insert(0, CategoryItem(
      data: const {
        "name" : "All",
        "icon" : FontAwesomeIcons.th,
      }, 
      seleted: true,)
    );*/
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
          children: List.generate(randomStatus.randomItemList.length,
            (index) => RandomItem(data: randomStatus.randomItemList[index])
          ),
        ),
      );
  }

  listTags() {
    return
    Obx(
      () => Column(
        children: List.generate(
            tagsStatus.tagItemList.length, (index) => TagsItem(data: tagsStatus.tagItemList[index])),
      ),
    );
  }
}