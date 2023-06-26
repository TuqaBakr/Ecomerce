import 'package:flutter/material.dart';
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
      const Center(child: Text("Loading")) :
      statusReqest == StatusReqest.offlinefailure ?
      const Center(child: Text("Off Line failure ")) :
      statusReqest == StatusReqest.serverfailure ?
      const Center(child: Text("server failure")) :
      statusReqest == StatusReqest.failure ?
      const Center(child: Text("No Data")) : widget;
  }
}


