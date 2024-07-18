

import '../base_response_model.dart';
import 'buyer_outlet_list_meta_model.dart';

class BuyerOutletListResModel extends BaseResponseModel {
  BuyerOutletsListDataModel? data;

  BuyerOutletListResModel({
    required super.code,
    required super.message,
    super.error,
    super.errors,
    this.data,
  });

  factory BuyerOutletListResModel.fromJson(Map<String, dynamic> json) =>
      BuyerOutletListResModel(
        code: json['code'],
        message: json['message'],
        error: json['error'],
        errors: json['errors'],
        data: json['data'] == null
            ? null
            : BuyerOutletsListDataModel.fromJson(
            json['data'] as Map<String, dynamic>),
      );
}

class BuyerOutletsListDataModel {
  BuyerOutletListMetaModel? buyerOutlets;

  BuyerOutletsListDataModel({
    this.buyerOutlets,
  });

  factory BuyerOutletsListDataModel.fromJson(Map<String, dynamic> json) =>
      BuyerOutletsListDataModel(
        buyerOutlets: json['buyer_outlets'] == null
            ? null
            : BuyerOutletListMetaModel.fromJson(
            json['buyer_outlets'] as Map<String, dynamic>),
      );
}
