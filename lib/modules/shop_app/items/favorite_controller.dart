import 'package:get/get_state_manager/get_state_manager.dart';

class FavoriteController extends GetxController{

  Map isfavorite ={

  };

  setFavorite(id, val){
    isfavorite[id] = val ;
    update();
  }



}