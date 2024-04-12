import 'package:dio/dio.dart';
import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/req/register_req.dart';
import 'package:e_commerse/app/networks/models/req/register_resend_req.dart';
import 'package:e_commerse/app/networks/models/req/register_verify_req.dart';
import 'package:e_commerse/app/networks/models/req/signin_req.dart';
import 'package:e_commerse/app/networks/models/req/signin_resend_req.dart';
import 'package:e_commerse/app/networks/models/req/signin_verify_req.dart';
import 'package:e_commerse/app/networks/models/res/register_res.dart';
import 'package:e_commerse/app/networks/models/res/register_resend_res.dart';
import 'package:e_commerse/app/networks/models/res/register_verify_res.dart';
import 'package:e_commerse/app/networks/models/res/signin_res.dart';
import 'package:e_commerse/app/networks/models/res/signin_resend_res.dart';
import 'package:e_commerse/app/networks/models/res/signin_verify_res.dart';

class AuthRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<RegisterRes?> register(RegisterReq registerReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.register,
        data: registerReq.toJson(),
      );
      if (response.statusCode == 200) {
        final registerResponse = RegisterRes.fromJson(response.data);
        if (registerResponse.email != null) {
          return registerResponse;
        } else {
          final registerResponse = RegisterRes(error: ("Something went wrong"));
          return registerResponse;
        }
      } else {
        final registerResponse = RegisterRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return registerResponse;
        } else {
          return registerResponse;
        }
      }
    } catch (e) {
      return throw Exception(RegisterRes(error: e.toString()));
    }
  }

  Future<RegisterVerifyRes?> registerVerify(
      RegisterVerifyReq registerVerifyReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.registerVerify,
        data: registerVerifyReq.toJson(),
      );
      if (response.statusCode == 200) {
        final registerVerifyResponse =
            RegisterVerifyRes.fromJson(response.data);
        if (registerVerifyResponse.token != null) {
          return registerVerifyResponse;
        } else {
          final registerVerifyResponse =
              RegisterVerifyRes(error: ("Something went wrong"));
          return registerVerifyResponse;
        }
      } else {
        final registerVerifyResponse =
            RegisterVerifyRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return registerVerifyResponse;
        } else {
          return registerVerifyResponse;
        }
      }
    } catch (e) {
      return throw Exception(RegisterVerifyRes(error: e.toString()));
    }
  }

  Future<RegisterResendRes?> registerResend(
      RegisterResendReq registerResendReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.RegisterResend,
        data: registerResendReq.toJson(),
      );
      if (response.statusCode == 200) {
        final registerResendResponse =
            RegisterResendRes.fromJson(response.data);
        if (registerResendResponse.user != null) {
          return registerResendResponse;
        } else {
          final registerResendResponse =
              RegisterResendRes(error: ("Something went wrong"));
          return registerResendResponse;
        }
      } else {
        final registerResendResponse =
            RegisterResendRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return registerResendResponse;
        } else {
          return registerResendResponse;
        }
      }
    } catch (e) {
      return throw Exception(RegisterResendRes(error: e.toString()));
    }
  }

  Future<SigninRes?> signin(SigninReq signinReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.signIn,
        data: signinReq.toJson(),
      );

      if (response.statusCode == 200) {
        final signinResponse = SigninRes.fromJson(response.data);
        if (signinResponse.user != null) {
          return signinResponse;
        } else {
          final signinResponse = SigninRes(error: ("Something went wrong"));
          return signinResponse;
        }
      } else {
        final signinResponse = SigninRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return signinResponse;
        } else {
          return signinResponse;
        }
      }
    } catch (e) {
      return throw Exception(SigninRes(error: e.toString()));
    }
  }

  Future<SigninVerifyRes?> signinVerify(SigninVerifyReq signinVerifyReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.signInVerify,
        data: signinVerifyReq.toJson(),
      );

      if (response.statusCode == 200) {
        final signinVerifyResponse = SigninVerifyRes.fromJson(response.data);
        if (signinVerifyResponse.token != null) {
          return signinVerifyResponse;
        } else {
          final signinVerifyResponse =
              SigninVerifyRes(error: ("Something went wrong"));
          return signinVerifyResponse;
        }
      } else {
        final signinVerifyResponse = SigninVerifyRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return signinVerifyResponse;
        } else {
          return signinVerifyResponse;
        }
      }
    } catch (e) {
      return throw Exception(SigninVerifyRes(error: e.toString()));
    }
  }

  Future<SigninResendRes?> signinResend(SigninResendReq signinResendReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.signInResend,
        data: signinResendReq.toJson(),
      );

      if (response.statusCode == 200) {
        final signinResendResponse = SigninResendRes.fromJson(response.data);
        if (signinResendResponse.message != null) {
          return signinResendResponse;
        } else {
          final signinResendResponse =
              SigninResendRes(error: ("Something went wrong"));
          return signinResendResponse;
        }
      } else {
        final signinResendResponse = SigninResendRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return signinResendResponse;
        } else {
          return signinResendResponse;
        }
      }
    } catch (e) {
      return throw Exception(SigninResendRes(error: e.toString()));
    }
  }
}
