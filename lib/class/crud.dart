// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
//import 'package:weam/class/statusrequest.dart';
import 'package:http/http.dart' as http;
import 'package:weam/function/check_internet.dart';
import 'package:weam/class/crud.dart';
import 'statusrequest.dart';
//import 'package:weam/function/check_internet.dart';


class Crud {
  Future <Either<StatusReqest, Map>> postData(String linkurl,Map data) async {
    print('hhh');
    var response = await http.post(
      Uri.parse(linkurl),
      body: data,
    );

    print("tttttttttttttt");
    var responsebody = jsonDecode(response.body) ;
    print(responsebody);
    print("3434343434434$response.statusCode");
    if(response.statusCode==200 || response.statusCode==201)
    {
      return  Right(responsebody) ;
    }
    else if (response.statusCode==400 || response.statusCode==404 )
    {
      print("mohmsad");
      return  const Left(StatusReqest.serverfailure) ; //response.statusCode;
    }
    else
      {
      print("asmaa");
      print(response.statusCode);
      print(response.body);
      return const Left(StatusReqest.offlinefailure) ;
    }
  }



  ////////////////////////////// http.get ((((((((((((((( GET Request )))))))))))))))))) ////////////////////////////////
  Future <Either<StatusReqest, Map>> getData(String linkurl) async {
    print('hhh');
    //if(await checkinternet()){
      var response = await http.get(
        Uri.parse(linkurl),
      );

      //
    var responsebody = jsonDecode(response.body) ;
    print(responsebody);

    //
      print("tttttttttttttt");
      print(response);
      if(response.statusCode==200 || response.statusCode==201)
      {

        return  Right(responsebody) ; //responsebody ;

      }
      else if (response.statusCode==400 || response.statusCode==404)
      {
        print("mohmsad");
        return  const Left(StatusReqest.failure) ; //response.statusCode;
      }
      else{
        print("asmaa");
        return const Left(StatusReqest.offlinefailure) ;
      }
   // }
   // else{
     // return const Left(StatusReqest.offlinefailure);
   // }
    /*
   var response = await http.get(
      Uri.parse(linkurl),
    );

    print("tttttttttttttt");
    print(response);
    if(response.statusCode==200 || response.statusCode==201)
    {
      var responsebody = jsonDecode(response.body) ;
      print(responsebody);
      return  Right(responsebody) ; //responsebody ;

    }
     else if (response.statusCode==400 || response.statusCode==404 || response.statusCode==500 )
    {
      print("mohmsad");
      return  const Left(StatusReqest.serverfailure) ; //response.statusCode;
    }
    else{
      print("asmaa");
      return Left(StatusReqest.offlinefailure) ;
    }
    */

  }
  Future <Either<StatusReqest, Map>> gettData(String linkurl, String token) async {
    print('hhh');
    //if(await checkinternet()){
    var response = await http.get(
        Uri.parse(linkurl),
        headers: {
          "token" : token ,
        }
    );

    //
    var responsebody = jsonDecode(response.body) ;
    print(responsebody);

    //
    print("tttttttttttttt");
    print(response);
    if(response.statusCode==200 || response.statusCode==201)
    {

      return  Right(responsebody) ; //responsebody ;

    }
    else if (response.statusCode==400 || response.statusCode==404)
    {
      print("mohmsad");
      return  const Left(StatusReqest.failure) ; //response.statusCode;
    }
    else{
      print("asmaa");
      return const Left(StatusReqest.offlinefailure) ;
    }
    // }
    // else{
    // return const Left(StatusReqest.offlinefailure);
    // }
    /*
   var response = await http.get(
      Uri.parse(linkurl),
    );

    print("tttttttttttttt");
    print(response);
    if(response.statusCode==200 || response.statusCode==201)
    {
      var responsebody = jsonDecode(response.body) ;
      print(responsebody);
      return  Right(responsebody) ; //responsebody ;

    }
     else if (response.statusCode==400 || response.statusCode==404 || response.statusCode==500 )
    {
      print("mohmsad");
      return  const Left(StatusReqest.serverfailure) ; //response.statusCode;
    }
    else{
      print("asmaa");
      return Left(StatusReqest.offlinefailure) ;
    }
    */

  }



}




////////////////////////////// http.post ((((((((((((((( post Request )))))))))))))))))) ////////////////////////////////
/*class Curd1{
  Future <Either<StatusReqest, Map>> postData(String linkurl,Map data) async {
    print('hhh');
    var response = await http.post(
      Uri.parse(linkurl),
      body: data,
    );

    print("tttttttttttttt");
    print(response);
    if(response.statusCode==200 || response.statusCode==201)
    {
      //  EasyLoading.showSuccess("welcome....");
      var responsebody = jsonDecode(response.body) ;
      print(responsebody);
      return  Right(responsebody) ; //responsebody ;

    }
    else if (response.statusCode==400 || response.statusCode==404 || response.statusCode==500 )
    {
      // EasyLoading.showError('ERORR ,password not match');
      // message = responsebody['message'];
      print("mohmsad");
      return  const Left(StatusReqest.serverfailure) ; //response.statusCode;
    }
    else{
      //  EasyLoading.showError('ERORR, TRY again');
      //  var js= jsonDecode(response.body);
      //message = js['message'];
      // print(message);
      print("asmaa");
      return Left(StatusReqest.offlinefailure) ;
    }
  }
}*/



/*
class Ccrud {
  Future<Either<StatusReqest, Map>> getData(String linkurl) async {
    print('hhh');
    var response = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/viewcatigory"),
    );

    print('tt');
    if(response.statusCode==200 || response.statusCode==201)
    {
      EasyLoading.showSuccess("welcome....");
      var js= jsonDecode(response.body);
      //info.USER_TOKEN = js["access_token"];
    //  String Token = js["access_token"];
      //UserInformation.USER_TOKEN = Token;
      // UserInformation.USER_TOKEN = Token;
      Get.offAllNamed('/advice');
    //print ('the token is $Token');
      print (js) ;
      print (response.statusCode);
      print ('tesst');
      //print (UserInformation.USER_TOKEN);
      //   print(UserInformation.USER_TOKEN);
    }
    else if(response.statusCode==404)
    {
      EasyLoading.showError('ERORR ,password not match');
      var js= jsonDecode(response.body);
      message = js['message'];
      print(message);
      print("mohmsad");
    }
    else if(response.statusCode==422)
    {
      EasyLoading.showError('ERORR ,poor intormatioin');
      var js= jsonDecode(response.body);
      message = js['message'];
      print(message);
      print("mohmsad");
    }
    else{
      EasyLoading.showError('ERORR, TRY again');
      var js= jsonDecode(response.body);
      message = js['message'];
      print(message);
      print("asmaa");

    }


  }
}
*/





