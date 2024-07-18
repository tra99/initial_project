import 'package:flutter/material.dart';
import '../constant/app_text.dart';
import '../manager/sample_manager.dart';
import '../model/sample/buyer_outlets_each_model.dart';
import '../widget/state_widget/base_stream_handler.dart';
import '../widget/state_widget/on_error_widget.dart';

class SampleList extends StatefulWidget {
  const SampleList({super.key});

  @override
  State<SampleList> createState() => _SampleListState();
}

class _SampleListState extends State<SampleList> {
  
  late SampleManager sampleManager;
  Future<void> getAllList() async {
    await sampleManager.getListData();
  }

  @override
  void initState() {
    super.initState();
    sampleManager = SampleManager.getProvider(context)
      ..getListData();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build");

    return Scaffold(
      appBar: AppBar(),
      body:BaseStreamBuilder<List<BuyerOutletsEachModel>>(
          stream: sampleManager.dataListController.stream,
          onRefresh: ()async{
            getAllList();
          },
          error: (err){
            return  OnErrorWidget(
              onRefresh: ()async{
                getAllList();
              },
              errorMessage: err,
            );
          },
          ready: (data){
            return 
            RefreshIndicator(
              onRefresh: ()async{
                getAllList();
                await Future.delayed(const Duration(seconds: 3));
              },
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_,int index){
                    var item = data[index];
                    return Card(
                      color: Colors.amberAccent,
                      child: AppText.title(item.companyName??""),
                    );
                  }),
            );
          }
      ) ,
    );
  }
}
