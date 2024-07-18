
import '../../constant/app_constant.dart';
import '../../model/sample/buyer_outlet_list_res_model.dart';
import '../base_api_service.dart';

class SampleApiService extends BaseApiService{
  Future<BuyerOutletListResModel> getListBuyerOutlet({
    String? latitude,
    String? longitude,
  }) {
    return onRequest(
      path: ApiName.BUYER_OUTLET,
      method: HttpMethod.GET,
      headers: {"Accept": "application/json"},
      requiredToken: true,
      query: latitude != null || longitude != null
          ? {'latitude': latitude, 'longitude': longitude, "specific": 1}
          : null,
      onSuccess: (response) {
        return BuyerOutletListResModel.fromJson(response.data);
      },
    );
  }
}
// class ApiService extends 