import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weam/class/imagasset.dart';
import 'package:weam/class/statusrequest.dart';

 class HandlingDataView extends StatelessWidget{
  final StatusReqest  statusReqest;
  final Widget widget;
  const HandlingDataView (
      {Key? key ,required this.statusReqest, required this.widget})
      :super(key: key);

  @override
  Widget build(BuildContext context){
    return
      statusReqest == StatusReqest.loading ?
      Center(child:Lottie.asset( AppImageAsset.loading1)) :
      statusReqest == StatusReqest.offlinefailure ?
       Center(child: Lottie.asset( AppImageAsset.offline)) :
      statusReqest == StatusReqest.serverfailure ?
       Center(child: Lottie.asset( AppImageAsset.server_failure)) :
      statusReqest == StatusReqest.failure ?
       Center(child: Lottie.asset( AppImageAsset.nodata)) : widget;
  }
}


