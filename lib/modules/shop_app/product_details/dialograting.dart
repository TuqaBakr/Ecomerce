import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:weam/modules/shop_app/logo/logo.dart';
import 'package:weam/modules/shop_app/product_details/product_details_controller.dart';
import '../../../constant.dart';

void showDialogRating(BuildContext context ,String product_id){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      title:const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message:const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style:  TextStyle(fontSize: 15),
      ),
      image:const Logo(),
      submitButtonText: 'Submit',
      submitButtonTextStyle:const TextStyle(
        color: forthBackColor,
        fontWeight: FontWeight.bold,
      ),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ProductDetailsControllerImp controller = Get.find() ;
        controller.submitRating(int.parse(product_id),response.rating);
      },
    ),
  );
}