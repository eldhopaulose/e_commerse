import 'package:dio/dio.dart';
import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/req/register_req.dart';
import 'package:e_commerse/app/networks/models/req/register_resend_req.dart';
import 'package:e_commerse/app/networks/models/req/register_verify_req.dart';
import 'package:e_commerse/app/networks/models/res/register_res.dart';
import 'package:e_commerse/app/networks/models/res/register_resend_res.dart';
import 'package:e_commerse/app/networks/models/res/register_verify_res.dart';

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
      return RegisterRes(error: "Unexpected Error");
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
      return RegisterVerifyRes(error: "Unexpected Error");
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
      return RegisterResendRes(error: "Unexpected Error");
    }
  }
}
