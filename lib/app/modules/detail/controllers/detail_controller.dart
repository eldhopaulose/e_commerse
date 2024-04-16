import 'package:e_commerse/app/networks/dio/repo/product_repo.dart';
import 'package:e_commerse/app/networks/models/res/get_single_product_by_id.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<GetSingleProductByIdRes?> getSingleProductById(String id) async {
    final ProductRepo repo = ProductRepo();
    final response = await repo.getSingleProduct(id);
    return response;
  }
}
