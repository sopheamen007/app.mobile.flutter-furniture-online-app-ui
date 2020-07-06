import 'package:flutter/material.dart';
import 'package:furniture_ui_app/constant/data.dart';
import 'package:furniture_ui_app/pages/product_detail_page.dart';
import 'package:furniture_ui_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }
  Widget getBody(){
    return SafeArea(
          child: ListView(
        padding: EdgeInsets.only(left: 20,right: 20),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Furniture",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),),
              Row(
                children: <Widget>[
                  Icon(LineIcons.heart_o,size: 28,),
                  SizedBox(width: 10,),
                  Icon(LineIcons.search,size: 28,)
                ],
              )
            ],
          ),
          SizedBox(height: 30,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
                      child: Row(children: List.generate(menus.length, (index) => 
            InkWell(
              onTap: (){
                setState(() {
                  activeIndex = index;
                });
              },
                          child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: activeIndex == index ? primary : Colors.transparent,
                    border: Border.all(
                      color: activeIndex == index ? Colors.transparent : primary
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(menus[index],style: TextStyle(
                      color: activeIndex == index ? white : primary,
                      fontSize: 16
                    ),),
                  ),
                ),
              ),
            )
            )),
          ),
          SizedBox(height: 50,),
          Column(
            children: List.generate(items.length, (index) => 
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
                  id: items[index]['id'],
                  name: items[index]['name'],
                  img: items[index]['img'],
                  code: items[index]['code'],
                  pPrice: items[index]['p_price'].toString(),
                  pPromotionPrice: items[index]['p_promotion_price'].toString(),
                )));
              },
                          child: Card(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: items[index]['id'].toString(),
                                      child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(items[index]['img']),fit: BoxFit.cover)
                    ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(items[index]['name'],style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Text(items[index]['p_promotion_price'].toString()+" USD",style: TextStyle(
                        fontSize: 16,
                      ),),
                      SizedBox(width: 20,),
                      Text(items[index]['p_price'].toString()+" USD",style: TextStyle(
                        fontSize: 17,
                        color: warning,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough
                      ),),
                        ],
                      )
                    ],
                  )
                ],
              ),
          ),
            )
            ),
          )
        ],
      ),
    );
  }
}