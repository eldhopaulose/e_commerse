import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final selectedCategory = ''.obs;

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

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }
}
