
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

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
// late List<NaverPlaceModel> randomItemList = [];
  final logger = Logger();
  final LoadingStatus loadingStatus = Get.put(LoadingStatus());
  final TagsPlaceStatus tagsStatus = Get.put(TagsPlaceStatus());
  final RandomPlaceStatus randomStatus = Get.put(RandomPlaceStatus());
  final LocationStatus locationStatus = Get.put(LocationStatus());
  final FavoriteStoreStatus favoriteStoreStatus = Get.put(FavoriteStoreStatus());

  Future getData() async {
    loadingStatus.updateTagLoading(true);
    loadingStatus.updateMainLoading(true);
    await locationStatus.updateLocation(null);
    await randomStatus.updateItem();
    await tagsStatus.updateTag(tagsStatus.selectedTag.value);
  }

  @override
  void initState() {
    getData();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        getData();
        logger.d("[LIFE CYCLE] resumed");
        break;
      case AppLifecycleState.inactive:
        logger.d("[LIFE CYCLE] inactive");
        break;
      case AppLifecycleState.paused:
        logger.d("[LIFE CYCLE] paused");
        break;
      case AppLifecycleState.detached:
        logger.d("[LIFE CYCLE] detached");
        break;
    }
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("FOOD DICE", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600, fontFamily: gmarketSansTTFBold),),
                      SizedBox(width: 5,),
                      Text("(beta)", style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.w600, fontFamily: gmarketSansTTFLight),),
                    ],
                  )
                  // child: const Text("FOOD DICE", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600, fontFamily: gmarketSansTTFBold),),
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
                  // ?????? ?????????, query=?????????, listRandom
                  Text("?????? ???????????? ??????????", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: gmarketSansTTFMedium),),
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
              // ???????????? ?????? ?????????, query=TAG, listTags
              child: const Text("?????? ??????????????? ??????????", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: gmarketSansTTFMedium),),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 0),
              child: listCategories(),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Obx(() => loadingStatus.isTagLoading.value ? const CustomLoading(left: 0) : listTags()),
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
            (index) => RandomItem(data: randomStatus.randomItemList[index], latLong: locationStatus.currentLocation.value,)
          ),
        ),
      );
  }

  listTags() {
    return
    Obx(
      () => Column(
        children: List.generate(
            tagsStatus.tagItemList.length, (index) => TagsItem(data: tagsStatus.tagItemList[index], latLong: locationStatus.currentLocation.value,)),
      ),
    );
  }
}