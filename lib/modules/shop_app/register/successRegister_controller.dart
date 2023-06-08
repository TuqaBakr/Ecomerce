import 'package:get/get.dart';
import 'package:weam/routes.dart';

abstract  class successRegisterController extends GetxController{
  goToPageLogin();
}
class successRegisterControllerImp extends successRegisterController {
  @override
  goToPageLogin() {
    Get.offNamed(AppRoute.loginShop);
  }
}