import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../api_service/client/index.dart';
import '../async_subject_manager/async_subject_manager.dart';
import '../model/sample/buyer_outlet_list_res_model.dart';
import '../model/sample/buyer_outlets_each_model.dart';

class SampleManager {
  static SampleManager getProvider(BuildContext context,
      [bool listen = false]) =>
      Provider.of<SampleManager>(
        context,
        listen: listen,
      );
      
  late AsyncSubjectManagers<List<BuyerOutletsEachModel>> dataListController;

  SampleManager(){
    dataListController = AsyncSubjectManagers<List<BuyerOutletsEachModel>>();
  }


  Future<void> getListData()async{
    dataListController.asyncOperation(() async {
      BuyerOutletListResModel serviceModel = await serviceApi.getListBuyerOutlet();
      return serviceModel.data?.buyerOutlets?.list??[];
    });
  }


  void dispose(){
    dataListController.dispose();
  }

}