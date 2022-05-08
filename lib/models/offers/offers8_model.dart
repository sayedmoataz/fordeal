class Offers8Model{
  List<Offers8DataModel>data=[];
  Offers8Model.fromJson(var json){
    json.forEach((element) {
      data.add(Offers8DataModel.fromJson(element));
    });
  }
}

class Offers8DataModel {
  late final String id;
  late final String prodId;
  late final String userId;
  late final String compId;
  late final String prodSort;
  late final String catId1;
  late final String catId2;
  late final String catId3;
  late final String countryId;
  late final String catNameAr1;
  late final String catNameEn1;
  late final String catNameTr1;
  late final String catNameAr2;
  late final String catNameEn2;
  late final String catNameTr2;
  late final String catNameAr3;
  late final String catNameEn3;
  late final String catNameTr3;
  late final String brandId;
  late final String brandNameAr;
  late final String brandNameEn;
  late final String brandNameTr;
  late final String prodNameAr;
  late final String prodNameEn;
  late final String prodNameTr;
  late final String prodDescAr;
  late final String prodDescEn;
  late final String prodDescTr;
  late final String prodKud;
  late final String prodImg;
  late final String prodAct;
  late final String archive;
  late final String prodPrice;
  late final String prodPriceOld;
  late final String prodNo;
  late final String prodVid;
  late final String allVideoUrl;
  late final String isOffer;
  late final String vendorName;
  late final String prodView;
  late final String khasem;
  late final String hadeya;

  Offers8DataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    prodId = json['prod_id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    prodSort = json['prod_sort'];
    catId1 = json['cat_id1'];
    catId2 = json['cat_id2'];
    catId3 = json['cat_id3'];
    countryId = json['country_id'];
    catNameAr1 = json['cat_name_ar1'];
    catNameEn1 = json['cat_name_en1'];
    catNameTr1 = json['cat_name_tr1'];
    catNameAr2 = json['cat_name_ar2'];
    catNameEn2 = json['cat_name_en2'];
    catNameTr2 = json['cat_name_tr2'];
    catNameAr3 = json['cat_name_ar3'];
    catNameEn3 = json['cat_name_en3'];
    catNameTr3 = json['cat_name_tr3'];
    brandId = json['brand_id'];
    brandNameAr = json['brand_name_ar'];
    brandNameEn = json['brand_name_en'];
    brandNameTr = json['brand_name_tr'];
    prodNameAr = json['prod_name_ar'];
    prodNameEn = json['prod_name_en'];
    prodNameTr = json['prod_name_tr'];
    prodDescAr = json['prod_desc_ar'];
    prodDescEn = json['prod_desc_en'];
    prodDescTr = json['prod_desc_tr'];
    prodKud = json['prod_kud'];
    prodImg = json['prod_img'];
    prodAct = json['prod_act'];
    archive = json['archive'];
    prodPrice = json['prod_price'];
    prodPriceOld = json['prod_price_old'];
    prodNo = json['prod_no'];
    prodVid = json['prod_vid'];
    allVideoUrl = json['all_video_url'];
    isOffer = json['is_offer'];
    vendorName = json['vendor_name'];
    prodView = json['prod_view'];
    khasem = json['khasem'];
    hadeya = json['hadeya'];
  }

}