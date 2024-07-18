

import 'buyer_outlets_each_model.dart';
import '../meta.dart';

class BuyerOutletListMetaModel {
  List<BuyerOutletsEachModel>? list;
  Meta? meta;

  BuyerOutletListMetaModel({
    this.list,
    this.meta,
  });

  factory BuyerOutletListMetaModel.fromJson(Map<String, dynamic> json) =>
      BuyerOutletListMetaModel(
        list: json['list'] == null
            ? []
            : (json['list'] as List<dynamic>)
            .map((e) =>
            BuyerOutletsEachModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
      );
}
