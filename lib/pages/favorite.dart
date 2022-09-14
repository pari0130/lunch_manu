
import 'package:flutter/material.dart';
import 'package:lunch_manu/fonts/gmatket_font_family.dart';
import 'package:lunch_manu/theme/color.dart';
import 'package:lunch_manu/widgets/widgets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({ Key? key }) : super(key: key);

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<FavoritePage> {
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
                  child: const Text("FOOD DICE", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600, fontFamily: gmarketSansTTFBold),),
                ),
              ),
              //NotificationBox(number: 1,)
          ],),
        ),
        body: getBody(),
      );
  }

  getBody(){
    return
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: CustomTextBox(hint: "Search", prefix: Icon(Icons.search, color: darker), suffix: Icon(Icons.filter_list_outlined, color: primary))
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: listLikes(),
            ),
            SizedBox(height: 20,),
          ],
        ),
      );
  }

  listLikes(){
    return
      Column(
        // children: List.generate(featured.length,
        //   (index) => RandomItem(data: featured[index])
        // ),
      );
  }
}