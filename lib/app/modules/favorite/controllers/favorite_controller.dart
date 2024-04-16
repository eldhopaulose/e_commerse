import 'dart:async';

import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/networks/dio/repo/like_repo.dart';
import 'package:e_commerse/app/networks/models/res/get_all_liked_byid_res.dart';
import 'package:e_commerse/app/networks/models/res/get_all_likes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  bool isCircle = false;

  final StreamController<GetAllLikesRes?> _fetchAllLiked =
      StreamController<GetAllLikesRes?>.broadcast();

  Stream<GetAllLikesRes?> get fetchCustomerProductLikede =>
      _fetchAllLiked.stream;

  final StreamController<GetAllLikesByIdRes?> _fetchAllLikedByID =
      StreamController<GetAllLikesByIdRes?>.broadcast();

  Stream<GetAllLikesByIdRes?> get fetchCustomerProductLikedeById =>
      _fetchAllLikedByID.stream;

  @override
  void onInit() {
    getAllLiked().then((_) {
      // Call getAllLiked after getProducts completes successfully
      getAllLikedbyId();
    });
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

  Future getAllLiked() async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.getAllLikesData();

    _fetchAllLiked.sink.add(response!);
  }

  onlikeProduct(String productId, context) async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.like(productId);
    getAllLiked().then((_) {
      // Call getAllLiked after getProducts completes successfully
      getAllLikedbyId();
    });
    if (response?.error != null) {
      error(context, response!.error, Colors.red, "Error", Icons.error,
          Colors.red);
    }
  }

  onunlikeProduct(String productId, context) async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.unlike(productId);

    if (response?.error != null) {
      error(context, response!.error, Colors.red, "Error", Icons.error,
          Colors.red);
    }
  }

  Future getAllLikedbyId() async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.getAllLikes();

    _fetchAllLikedByID.sink.add(response!);
  }
}
