import 'package:e_commerse/app/networks/dio/dio_client.dart';

enum Endpoints {
  register,
  registerVerify,
  RegisterResend,
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
    }
    return hasToken;
  }
}
