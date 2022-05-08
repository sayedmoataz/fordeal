class MainCategoriesModel{
  List<AllCatsModel>data=[];
  MainCategoriesModel.fromJson(var json){
    json.forEach((element) {
      data.add(AllCatsModel.fromJson(element));
    });
  }
}

class AllCatsModel {
  String? id;
  String? userId;
  String? compId;
  String? catId;
  String? catNameAr;
  String? catNameEn;
  String? catNameTr;
  String? catTextAr;
  String? catTextEn;
  String? catImg;
  String? catIcone;
  String? smCatIcone;
  String? catAct;
  String? catSort;
  String? archive;
  String? showHome;
  String? showHomeTime;
  String? catImgSm;
  List<SubCats> subCats=[];


  AllCatsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    catId = json['cat_id'];
    catNameAr = json['cat_name_ar'];
    catNameEn = json['cat_name_en'];
    catNameTr = json['cat_name_tr'];
    catTextAr = json['cat_text_ar'];
    catTextEn = json['cat_text_en'];
    catImg = json['cat_img'];
    catIcone = json['cat_icone'];
    smCatIcone = json['sm_cat_icone'];
    catAct = json['cat_act'];
    catSort = json['cat_sort'];
    archive = json['archive'];
    showHome = json['show_home'];
    showHomeTime = json['show_home_time'];
    catImgSm = json['cat_img_sm'];
    if (json['subCats'] != null) {
      json['subCats'].forEach((v) {
        subCats.add(new SubCats.fromJson(v));
      });
    }
  }

}

class SubCats {
  String? id;
  String? userId;
  String? compId;
  String? catId;
  String? catNameAr;
  String? catNameEn;
  String? catNameTr;
  String? catTextAr;
  String? catTextEn;
  String? catImg;
  String? catIcone;
  String? smCatIcone;
  String? catAct;
  String? catSort;
  String? archive;
  String? showHome;
  String? showHomeTime;
  String? catImgSm;
  List<SubSubCats> subSubCats=[];


  SubCats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    catId = json['cat_id'];
    catNameAr = json['cat_name_ar'];
    catNameEn = json['cat_name_en'];
    catNameTr = json['cat_name_tr'];
    catTextAr = json['cat_text_ar'];
    catTextEn = json['cat_text_en'];
    catImg = json['cat_img'];
    catIcone = json['cat_icone'];
    smCatIcone = json['sm_cat_icone'];
    catAct = json['cat_act'];
    catSort = json['cat_sort'];
    archive = json['archive'];
    showHome = json['show_home'];
    showHomeTime = json['show_home_time'];
    catImgSm = json['cat_img_sm'];
    if (json['subSubCats'] != null) {
      json['subSubCats'].forEach((v) {
        subSubCats.add(new SubSubCats.fromJson(v));
      });
    }
  }

}

class SubSubCats {
  String? id;
  String? userId;
  String? compId;
  String? catId;
  String? catNameAr;
  String? catNameEn;
  String? catNameTr;
  String? catTextAr;
  String? catTextEn;
  String? catImg;
  String? catIcone;
  String? smCatIcone;
  String? catAct;
  String? catSort;
  String? archive;
  String? showHome;
  String? showHomeTime;
  String? catImgSm;



  SubSubCats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    catId = json['cat_id'];
    catNameAr = json['cat_name_ar'];
    catNameEn = json['cat_name_en'];
    catNameTr = json['cat_name_tr'];
    catTextAr = json['cat_text_ar'];
    catTextEn = json['cat_text_en'];
    catImg = json['cat_img'];
    catIcone = json['cat_icone'];
    smCatIcone = json['sm_cat_icone'];
    catAct = json['cat_act'];
    catSort = json['cat_sort'];
    archive = json['archive'];
    showHome = json['show_home'];
    showHomeTime = json['show_home_time'];
    catImgSm = json['cat_img_sm'];
  }

}