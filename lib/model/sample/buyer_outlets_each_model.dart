

class BuyerOutletsEachModel {
  int? id;
  String? companyName;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? primaryPhoneNumber;
  String? secondPhoneNumber;
  String? thirdPhoneNumber;
  String? facebookUrl;
  String? websiteUrl;
  String? address;
  String? createBy;
  String? latitude;
  String? longitude;
  int? adrProvinceId;
  int? adrDistrictId;
  int? adrCommuneId;
  int? adrVillageId;
  int? caoVisitId;
  String? companyImage;
  List<dynamic>? certificates;
  List<dynamic>? documents;

  String? distance;
  String? distanceType;
  List<dynamic>? marketDemands;

  String? lastUpdatedAt;
  bool isAllowToEdit;
  int? isActive;
  String?inActiveReason;

  BuyerOutletsEachModel({
    this.id,
    this.companyName,
    this.contactPersonName,
    this.contactPersonPhoneNumber,
    this.primaryPhoneNumber,
    this.secondPhoneNumber,
    this.thirdPhoneNumber,
    this.facebookUrl,
    this.websiteUrl,
    this.address,
    this.createBy,
    this.latitude,
    this.longitude,
    this.adrProvinceId,
    this.adrDistrictId,
    this.adrCommuneId,
    this.adrVillageId,
    this.caoVisitId,
    this.companyImage,
    this.certificates,
    this.documents,
    this.distance,
    this.distanceType,
    this.marketDemands,
    this.lastUpdatedAt,
    this.isAllowToEdit = true,
    this.isActive,
    this.inActiveReason
  });

  factory BuyerOutletsEachModel.fromJson(Map<String, dynamic> json) {

    return BuyerOutletsEachModel(
        id: json["id"],
        companyName: json["company_name"],
        contactPersonName: json["contact_person_name"],
        contactPersonPhoneNumber: json["contact_person_phone_number"],
        primaryPhoneNumber: json["primary_phone_number"],
        secondPhoneNumber: json["second_phone_number"],
        thirdPhoneNumber: json["third_phone_number"],
        facebookUrl: json["facebook_url"],
        websiteUrl: json["website_url"],
        address: json["address"],
        createBy: json["create_by"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        adrProvinceId: json["adr_province_id"],
        adrDistrictId: json["adr_district_id"],
        adrCommuneId: json["adr_commune_id"],
        adrVillageId: json["adr_village_id"],
        caoVisitId: json["cao_visit_id"],
        companyImage: json["company_image"],
        isAllowToEdit: json["is_allowed_edit"],
        certificates: json['certificates'] == null
            ? []
            : (json['certificates'] as List<dynamic>).toList(),
        documents: json['documents'] == null
            ? []
            : (json['documents'] as List<dynamic>).toList(),

        distance: json["distance"],
        distanceType: json["distance_type"],
        marketDemands: json['market_demands'] == null
            ? []
            : (json['market_demands'] as List<dynamic>).toList(),

        lastUpdatedAt: json["last_updated_at"],
        isActive: json["is_active"] == null?null:json["is_active"] == true?1:json["is_active"] ==false?0:json["is_active"],
        inActiveReason: json["inactive_reason"]
    );
  }

}

class BuyerPlace {
  int? id;
  String? code;
  String? nameKh;
  String? nameEn;

  BuyerPlace({
    this.id,
    this.code,
    this.nameKh,
    this.nameEn,
  });

  factory BuyerPlace.fromJson(Map<String, dynamic> json) => BuyerPlace(
    id: json["id"],
    code: json["code"],
    nameKh: json["name_kh"],
    nameEn: json["name_en"],
  );
}
