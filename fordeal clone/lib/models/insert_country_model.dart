class InsertCountryLangModel {
  String? result;
  var countryId;
  var lang;

  InsertCountryLangModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    countryId = json['country_id'];
    lang = json['lang'];
  }

}