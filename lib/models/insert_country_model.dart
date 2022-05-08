class InsertCountryLangModel {
  String? result;
  String? countryId;
  String? lang;
  String? coin;
  String? coinPrice;

  InsertCountryLangModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    countryId = json['country_id'];
    lang = json['lang'];
    coin = json['coin'];
    coinPrice = json['coin_price'];
  }

}