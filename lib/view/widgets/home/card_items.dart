import 'package:flutter/material.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class CardItems extends StatelessWidget {
  const CardItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.8,
          mainAxisSpacing: 9.0,
          crossAxisSpacing: 6.0,
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (context,index){
        return buildCardItems();
        },
    );
  }

  Widget buildCardItems(){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,

            ),
          ],
        ),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                    ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                  'https://media.istockphoto.com/photos/athletic-muscular-young-man-in-sports-outfit-is-preparing-to-start-picture-id1262702644?k=20&m=1262702644&s=612x612&w=0&h=VwVbXXLMyHtX5imHEZpfpsUxqYlFq-T19Qtb6HXvF1o=',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$15',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 3,
                        right: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            text: '4.7',
                            fontsize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            underline: TextDecoration.none,
                          ),
                          Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}
