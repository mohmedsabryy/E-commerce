
import 'package:ecommerce/models/products_models.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController{
 //.obs for stream data
   var products=<ProductModel>[].obs;
  var isLoading=true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts()async{
   var allProducts= await ProductServices.getAllProduct();

   try{
     isLoading(true);
     if(allProducts.isNotEmpty){
        products.addAll(allProducts);
     }
   }finally{
     isLoading(false);
   }

  }

}