import 'package:flutter/material.dart';
import 'package:furniture_ui_app/constant/data.dart';
import 'package:furniture_ui_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final String name;
  final String img;
  final String code;
  final String pPrice;
  final String pPromotionPrice;
  ProductDetailPage(
      {this.id,
      this.name,
      this.img,
      this.code,
      this.pPrice,
      this.pPromotionPrice});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
                      child: Padding(
              padding: EdgeInsets.only(left: 20),
                        child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_back_ios)),
            ),
          ),
          Hero(
            tag: widget.id.toString(),
                      child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.img),fit: BoxFit.cover)
            ),
            ),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              children: <Widget>[
                Text("Name :",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(width: 20,),
                Text(widget.name,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),)

              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              children: <Widget>[
                Text("Code :",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(width: 20,),
                Text(widget.code,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),)

              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              children: <Widget>[
                Text("Price :",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(width: 20,),
                Row(
                  children: <Widget>[
                    Text(widget.pPromotionPrice+" USD",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(width: 20,),
                Text(widget.pPrice+" USD",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: warning,
                  decoration: TextDecoration.lineThrough
                ),)
                  ],
                )

              ],
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Colors :",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(width: 20,),
                Flexible(
                                  child: Wrap(
                    children: List.generate(colors.length, (index) => 
                    Padding(
                      padding: const EdgeInsets.only(right: 15,bottom: 15),
                      child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.circle
                      ),
                  ),
                    )),
                  ),
                )

              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child: Row(
              children: <Widget>[
                Text("Qty :",style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(width: 20,),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          if(qty > 1){
                           setState(() {
                              qty = --qty;
                            }); 
                          }
                          
                          // minus here
                        },
                                              child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            shape: BoxShape.circle
                          ),
                          child: Icon(LineIcons.minus,size: 15,),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text(qty.toString(),style: TextStyle(
                        fontSize: 16
                      ),),
                      SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            qty = ++qty;
                          });
                          // minus here
                        },
                                              child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            shape: BoxShape.circle
                          ),
                          child: Icon(LineIcons.plus,size: 15,),
                        ),
                      ),
                      
                    ],
                  )
              ],
            ),
          ),
          SizedBox(height: 50,),
          InkWell(
            onTap: (){
              // your add cart function here
            },
                      child: Padding(padding: EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(
                child: Text("ADD TO CART",style: TextStyle(
                  color: white,
                  fontSize: 20,

                ),),
              ),
            ),),
          )
        ],
      ),
    );
  }
}
