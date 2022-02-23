import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  _SizeListState createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList=['S','M','L','XL','XXL','XXXL'];
  var currentSelected=0;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (context, index)
      {
        return GestureDetector(
            onTap: (){
              setState(() {
                currentSelected=index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: BoxDecoration(
                color: Get.isDarkMode?currentSelected==index?pinkClr.withOpacity(0.7):Colors.black:currentSelected==index?mainColor.withOpacity(0.7):Colors.white ,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.withOpacity(0.4),width: 2),
              ),
              child: Text(sizeList[index],style: TextStyle(color: Get.isDarkMode?Colors.white : Colors.black,),),
        ));
      },
          separatorBuilder: (context,index)=> const SizedBox(width: 2,),
          itemCount: sizeList.length),
    );
  }
}
