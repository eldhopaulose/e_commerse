import 'package:e_commerse/app/networks/dio/dio_client.dart';

enum Endpoints {
  register,
  registerVerify,
  RegisterResend,
  signIn,
  signInVerify,
  signInResend,
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
    }
    return hasToken;
  }
}
