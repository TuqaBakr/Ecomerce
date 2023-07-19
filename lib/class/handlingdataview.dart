import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weam/class/statusrequest.dart';
import 'package:weam/routes.dart';

class HandlingDataView extends StatelessWidget{
  final StatusReqest  statusRequest;
  final Widget widget;
  const HandlingDataView (
      {Key? key ,required this.statusRequest, required this.widget})
      :super(key: key);

  @override
  Widget build(BuildContext context){
    return
      statusRequest == StatusReqest.loading ?
      Center(child: Lottie.asset(AppImageAsset.loading4, width: 200, height: 200)):
      statusRequest == StatusReqest.offlinefailure ?
      Center(child: Lottie.asset(AppImageAsset.offline, width: 200, height: 200)) :
      statusRequest == StatusReqest.serverfailure ?
      Center(child: Lottie.asset(AppImageAsset.serverFailure, width: 200, height: 200)) :
      statusRequest == StatusReqest.failure ?
      Center(child: Lottie.asset(AppImageAsset.noData, width: 200, height: 200)) : widget;
  }
}


