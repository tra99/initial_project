
import 'dart:ui';

const Locale EN_LOCALE = Locale("en", "US");
const Locale KH_LOCALE = Locale("km", "KH");

const EN = 'en';
const KH = 'km';

const LANG_KH = "ភាសាខ្មែរ";
const LANG_EN = "English";

@Deprecated('This can be safely deleted')
const IMAGE_ASSET_PATH = '';
const ICON_ASSET_PATH = 'assets/icons/';

class AppConstant {
  static const int HOME_PAGE = 0;
  static const int REPORT_PAGE = 1;
  static const int FORUM_PAGE = 2;
  static const int LIBRERY_PAGE = 3;
  static const int MENUE = 4;
  static const int RESET_INDEX = 0;
  static String? USER_TOKEN;
  static String languageCode = 'km';
  static const String LANGUAGE_PATH = "assets/localizations";
  static String accuracy = "50";
  static String LANDSIZE_KEY = "landSize";
  static String WEIGHT_KEY = "weight";
  static String QUANTITY_KEY = "quantity";
  static String Fluid_KEY = "Fluid";
  static const String METFONE = "metfone";
  static const String CELLAED = "cellcard";
  static const String SMART = "smart";
  static const String KHR = "៛";
  static const String KHR_KEY = "KHR";
  static const String FORM_CHECKING_MES = "សូមបំពេញព័ត៌មានអោយបានត្រឹមត្រូវ";
}

class OfflineType{
  static const int FARMER_TYPE =1;
  static const String FARMER_TYPE_NAME = 'farmer';
  static const String FARMER_UPDATE_TYPE_NAME = 'update_farmer';
  static const String FARMER_PRODUCT_TYPE_NAME= 'farmer_products';
  static const String FARMER_PRODUCT_UPDATE_TYPE_NAME = 'update_farmer_products';
  static const String FARMER_EXPENSE_TYPE_NAME= 'farmer_expenses';
  static const String FARMER_INCOMES_TYPE_NAME= 'farmer_incomes';
  static const String FARMER_DELETE_EXPENSE_TYPE_NAME= 'farmer_delete_expense';
  static const String FARMER_DELETE_INCOME_TYPE_NAME= 'farmer_delete_income';
  static const String FARMER_DISABLE_TYPE_NAME= 'farmer_disable';
}

class FarmerFilterKey {
  static const String PROVINCE_KEY = "adr_province_id";
  static const String DISTRICT_KEY = "adr_district_id";
  static const String COMMUNE_KEY = "adr_commune_id";
  static const String VILLAGE_KEY = "adr_village_id";
  static const String SEARCH_TEXT_KET = "name";
  static const String TEXT_OPERATOR = "like";
  static const String PROVINCE_OPERATOR = "=";
  static const String CATEGORY_OPERATOR = "in";
  static const String CATEGORY_KEY = "products.product_id";
  static const String ACENDENT_SORT_KEY = "ASC";
  static const String DECENTDANCE_SORT_KEY = "DSC";
  static const String PRODUCT_GROUP_KEY = "products.product_info.product_id";
  static const String PRODUCT_KEY = "products.product_id";
  static const String PRODUCT_OPERATOR = "in";
}

class ErrorMessage {
  //static final String SOMETHING_WRONG = LocaleKeys.something_went_wrong.tr();
  static const String SOMETHING_WRONG = "Something went wrong";
  static const String CONNECTION_ERROR =
      "Connection error, please check your internet.";
  // LocaleKeys.error_connecting_to_server.tr();
  static const String TIMEOUT_ERROR = "Connection timeout";
  //LocaleKeys.connection_timeout.tr();
  static const String UNEXPECTED_ERROR = "Oops, Something went wrong";
  //LocaleKeys.unexpected_error.tr();
  static const String SERVER_ERROR = "Server error";

//LocaleKeys.server_error.tr();
}

class HttpMethod {
  HttpMethod._();
  static const String GET = "get";
  static const String POST = "post";
  static const String PATCH = "patch";
  static const String PUT = "put";
  static const String DELETE = "delete";
}

class ApiName {
  static const String CHECKIN = "/cao-visit/check-in";
  static const String SUPPLIER = "/supplier";
  static const String CATEGORY_SUPPLIER = "/supplier-items/category";
  static const String SUPPLIER_ITEM_UNIT = "/supplier-items/units";
  static const String PRODUCT_LIST = "/supplier-items";
  static const String STOCK_LIST = "/supplier-item-stocks";
  static const String BUYER_PRODUCT_GROUP_LIST = "/products/groups";
  static const String BUYER_PRODUCT_LIST_PRODUCT_GROUP = "/products";
  static const String BUYER_OUTLET = "/buyer-outlet";
  static const String CONFIG_GET_HOME_UPDATE = "/configuration/get-update";
  static const String ADD_BUYER_PRODUCT = "/buyer-outlet/products/add";
  static const String BUYER_OUTLET_PRODUCT_DEMANDS =
      "/buyer-outlet/products/demands";
  static const String FARMER = "/farmer";
  static const String ADD_FARMER_PRODUCT = "/farmer/products/add";
  static const String UPDATE_FARMER_PRODUCT_YEILD = "/farmer/products/yield";
  static const String PRODUCT_UNIT = "/products/units";
  static const String REPORT = '/report/performance';
  static const String FORUM = '/thread';
  static const String FAQ = '/faq';
  static const String TRANSECT = '/transect-assessment';
  static const String CHALLENGE_SOLUTION = '/challenge-solution';
}

class StatusCode {
  static const int success200 = 200;
  static const int unauthenticated403 = 403;
  static const int validationError406 = 406;
}

