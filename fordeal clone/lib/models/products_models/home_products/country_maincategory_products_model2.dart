class CountryMainCategoryProductsModel2{
  List<CountryMainCategoryProductsDataModel>data=[];
  CountryMainCategoryProductsModel2.fromJson(var json){
    json.forEach((element) {
      data.add(CountryMainCategoryProductsDataModel.fromJson(element));
    });
  }
}

class CountryMainCategoryProductsDataModel {
  String? id;
  String? prodId;
  String? userId;
  String? compId;
  String? prodSort;
  String? catId1;
  String? catId2;
  String? catId3;
  String? countryId;
  String? catNameAr1;
  String? catNameEn1;
  String? catNameTr1;
  String? catNameAr2;
  String? catNameEn2;
  String? catNameTr2;
  String? catNameAr3;
  String? catNameEn3;
  String? catNameTr3;
  String? brandId;
  String? brandNameAr;
  String? brandNameEn;
  String? brandNameTr;
  String? prodNameAr;
  String? prodNameEn;
  String? prodNameTr;
  String? prodDescAr;
  String? prodDescEn;
  String? prodDescTr;
  String? prodKud;
  String? prodImg;
  String? prodAct;
  String? archive;
  String? prodPrice;
  String? prodPriceOld;
  String? prodNo;
  String? prodVid;
  String? allVideoUrl;
  String? isOffer;


  CountryMainCategoryProductsDataModel.fromJson(Map<String, dynamic> json) {
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
  }

}