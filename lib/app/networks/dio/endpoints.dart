import 'package:e_commerse/app/networks/dio/dio_client.dart';

enum Endpoints {
  register,
  registerVerify,
  RegisterResend,
  signIn,
  signInVerify,
  signInResend,
  getUserData,
  getProductsData,
  getSingleProductById,
  addLike,
  unLike,
  getAllLiked,
  getAllLikes
}

extension EndpontData on Endpoints {
  String path() {
    String path = "";
    switch (this) {
      case Endpoints.register:
        path = "user/register";
      case Endpoints.registerVerify:
        path = "user/register/verify";
      case Endpoints.RegisterResend:
        path = "user/register/resend";
      case Endpoints.signIn:
        path = "user/signin";
      case Endpoints.signInVerify:
        path = "user/signin/verify";
      case Endpoints.signInResend:
        path = "user/signin/resend";
      case Endpoints.getUserData:
        path = "user/details";
      case Endpoints.getProductsData:
        path = "product/product";
      case Endpoints.getSingleProductById:
        path = "product/product/get";
      case Endpoints.addLike:
        path = "like/like";
      case Endpoints.unLike:
        path = "like/unlike";
      case Endpoints.getAllLiked:
        path = "like/likes";
      case Endpoints.getAllLikes:
        path = "like/likes-full-details";
    }
    return path;
  }

  ReqType type() {
    ReqType type;
    switch (this) {
      case Endpoints.register:
        type = ReqType.POST;
      case Endpoints.registerVerify:
        type = ReqType.POST;
      case Endpoints.RegisterResend:
        type = ReqType.POST;
      case Endpoints.signIn:
        type = ReqType.POST;
      case Endpoints.signInVerify:
        type = ReqType.POST;
      case Endpoints.signInResend:
        type = ReqType.POST;
      case Endpoints.getUserData:
        type = ReqType.GET;
      case Endpoints.getProductsData:
        type = ReqType.GET;
      case Endpoints.getSingleProductById:
        type = ReqType.GET;
      case Endpoints.addLike:
        type = ReqType.POST;
      case Endpoints.unLike:
        type = ReqType.POST;
      case Endpoints.getAllLiked:
        type = ReqType.GET;
      case Endpoints.getAllLikes:
        type = ReqType.GET;
    }
    return type;
  }

  bool hasToken() {
    bool hasToken = false;
    switch (this) {
      case Endpoints.register:
        hasToken = false;
      case Endpoints.registerVerify:
        hasToken = false;
      case Endpoints.RegisterResend:
        hasToken = false;
      case Endpoints.signIn:
        hasToken = false;
      case Endpoints.signInVerify:
        hasToken = false;
      case Endpoints.signInResend:
        hasToken = false;
      case Endpoints.getUserData:
        hasToken = true;
      case Endpoints.getProductsData:
        hasToken = false;
      case Endpoints.getSingleProductById:
        hasToken = false;
      case Endpoints.addLike:
        hasToken = true;
      case Endpoints.unLike:
        hasToken = true;
      case Endpoints.getAllLiked:
        hasToken = true;
      case Endpoints.getAllLikes:
        hasToken = true;
    }
    return hasToken;
  }
}
