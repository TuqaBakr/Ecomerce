import 'package:flutter/material.dart';
import 'package:weam/class/statusrequest.dart';

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
      const Center(child: Text("Loading")) :
      statusRequest == StatusReqest.offlinefailure ?
      const Center(child: Text("Off Line failure ")) :
      statusRequest == StatusReqest.serverfailure ?
      const Center(child: Text("server failure")) :
      statusRequest == StatusReqest.failure ?
      const Center(child: Text("No Data")) : widget;
  }
}


