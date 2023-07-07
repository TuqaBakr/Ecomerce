import 'package:weam/class/statusrequest.dart';

handlingData(response){
  if(response is StatusReqest) {
    return response ;
  }else{
    return StatusReqest.success ;
  }
}
