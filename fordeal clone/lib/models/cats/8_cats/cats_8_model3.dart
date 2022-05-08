class Sub8CatModel3{
  List<SubCats8DataModel>data=[];
  Sub8CatModel3.fromJson(var json){
    json.forEach((element) {
      data.add(SubCats8DataModel.fromJson(element));
    });
  }
}

class SubCats8DataModel {
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


  SubCats8DataModel.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['comp_id'] = this.compId;
    data['cat_id'] = this.catId;
    data['cat_name_ar'] = this.catNameAr;
    data['cat_name_en'] = this.catNameEn;
    data['cat_name_tr'] = this.catNameTr;
    data['cat_text_ar'] = this.catTextAr;
    data['cat_text_en'] = this.catTextEn;
    data['cat_img'] = this.catImg;
    data['cat_icone'] = this.catIcone;
    data['sm_cat_icone'] = this.smCatIcone;
    data['cat_act'] = this.catAct;
    data['cat_sort'] = this.catSort;
    data['archive'] = this.archive;
    data['show_home'] = this.showHome;
    data['show_home_time'] = this.showHomeTime;
    data['cat_img_sm'] = this.catImgSm;
    return data;
  }
}