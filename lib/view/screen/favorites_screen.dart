import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         height: 100,
      //         width: 100,
      //         child: Image.asset('assets/images/heart.png'),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Text(
      //         'Please, Add your favourite products',
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 17,
      //           color: Get.isDarkMode ? Colors.white : Colors.black,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: ListView.separated(
          itemBuilder: (context,index){
            return buildFavItems();
          },
          separatorBuilder:(context,index){
            return Divider(
              color: Colors.grey,
              thickness: 1,
            );
          },
          itemCount: 10,
      ),
    );
  }


  Widget buildFavItems(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child:Image.network(
                      'https://images.unsplash.com/photo-1644895986468-ddcc385751a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                    fit:BoxFit.cover ,
                  ) ,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title TitleTitleTitleTitleTitleTitleTitleTitlevvv',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$100',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.favorite ,
                  color: Colors.red,
                  size: 30,
                ),
            ),

          ],
        ),
      ),
    );
  }
}
