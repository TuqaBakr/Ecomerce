import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

validInput(String val , int  min , int max , String type){

  if (type == "username"){
    if(!GetUtils.isUsername(val)){
      return "not valid username".tr;
    }
  }

  if (type == "email"){
    if(!GetUtils.isEmail(val)){
      return "not valid email".tr;
    }
  }

  if (type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "not valid phone".tr;
    }
  }

  if (type == "search"){
    if(!GetUtils.isUsername(val)){
      return "Does not have product".tr;
    }
  }


  if (val.isEmpty){
    return "can't be Empty".tr;
  }

  if (val.length < min){
    return "can't be less than".tr + " $min";
  }

  if (val.length > max){
    return "can't be larger than".tr +"$max";
  }

}