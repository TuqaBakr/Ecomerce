import 'package:get/get.dart';
import 'package:weam/class/crud.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud()) ;
  }

}