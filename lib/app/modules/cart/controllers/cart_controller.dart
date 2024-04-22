import 'dart:async';
import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/networks/dio/repo/cart_repo.dart';
import 'package:e_commerse/app/networks/models/req/add_cart_req.dart';
import 'package:e_commerse/app/networks/models/req/update_cart_req.dart';
import 'package:e_commerse/app/networks/models/res/get_all_cart_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool isCircle = false;
  RxDouble totalCost = 0.0.obs;

  final StreamController<GetAllCartRes?> _fetchAllCart =
      StreamController<GetAllCartRes?>.broadcast();

  Stream<GetAllCartRes?> get fetchAllCart => _fetchAllCart.stream;
  @override
  void onInit() {
    getAllCart();
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

  void error(BuildContext context, error, Color color, String title,
      IconData icon, Color iconColor) {
    AchievementView(
      title: title,
      subTitle: error,
      isCircle: isCircle,
      listener: print,
      icon: Icon(icon, color: iconColor),
      iconBackgroundColor: Colors.white,
      color: color,
      borderRadius: BorderRadius.circular(12),
    ).show(context);
  }

  Future getAllCart() async {
    final CartRepo repo = CartRepo();
    final response = await repo.getAllCart();
    print(response);
    _fetchAllCart.sink.add(response!);
    updateTotalCost(response);
  }

  onCLickIncriment(String id) async {
    final CartRepo repo = CartRepo();
    final response = await repo.addCart(id, AddCartReq(quantity: 1));
    if (response!.error == null) {
      getAllCart();
    }
  }

  onCLickDeecriment(String id) async {
    final CartRepo repo = CartRepo();
    final response =
        await repo.cartQuantityDecriment(id, AddCartReq(quantity: 1));
    if (response!.error == null) {
      getAllCart();
    }
  }

  void updateTotalCost(GetAllCartRes response) {
    double total = 0;
    response.carts?.forEach((cart) {
      cart.items?.forEach((item) {
        total += item.totalCost ?? 0;
      });
    });
    totalCost.value = total;
  }

  onDeleteCart(String id) async {
    final CartRepo repo = CartRepo();
    final response = await repo.deleteCart(id);
    if (response!.error == null) {
      getAllCart();
      update();
    } else {
      error(Get.context!, response.error, Colors.red, "Error", Icons.error,
          Colors.red);
      getAllCart();
    }
  }
}
