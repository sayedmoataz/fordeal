class AdsModel{
  List<AdsDataModel>data=[];
  AdsModel.fromJson(var json){
    json.forEach((element) {
      data.add(AdsDataModel.fromJson(element));
    });
  }
}

class AdsDataModel {
  String? id;
  String? userId;
  String? compId;
  String? titleAr;
  String? titleEn;
  String? titleTr;
  String? textAr;
  String? textEn;
  String? textTr;
  String? imgUrl;
  String? act;
  String? dateFrom;
  String? dateTo;
  String? dateFromMk;
  String? dateToMk;
  String? link;
  String? yDate;
  String? star;
  String? starMk;
  String? adsPl;


  AdsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    titleTr = json['title_tr'];
    textAr = json['text_ar'];
    textEn = json['text_en'];
    textTr = json['text_tr'];
    imgUrl = json['img_url'];
    act = json['act'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    dateFromMk = json['date_from_mk'];
    dateToMk = json['date_to_mk'];
    link = json['link'];
    yDate = json['y_date'];
    star = json['star'];
    starMk = json['star_mk'];
    adsPl = json['ads_pl'];
  }

}