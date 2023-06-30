import 'dart:convert';
import 'package:dartz/dartz.dart';
//import 'package:weam/class/statusrequest.dart';
import 'package:http/http.dart' as http;
import 'package:weam/function/check_internet.dart';

import 'statusrequest.dart';
//import 'package:weam/function/check_internet.dart';

class Crud {
  Future<Either<StatusReqest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkinternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusReqest.serverfailure);
        }
      }
      else {
        return const Left(StatusReqest.offlinefailure) ;
      }
    }
    catch(_){
      return const Left(StatusReqest.serverfailure) ;
    }
  }
}
