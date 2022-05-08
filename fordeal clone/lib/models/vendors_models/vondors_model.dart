class VendorsModel{
  List<VendorsDataModel>data=[];
  VendorsModel.fromJson(var json){
    json.forEach((element) {
      data.add(VendorsDataModel.fromJson(element));
    });
  }
}

class VendorsDataModel {
  String? id;
  String? vendorId;
  String? vendorName;
  String? vendorNameEn;
  String? vendorNameTr;
  String? vendorEmail;
  String? sclose;
  String? stextclose;
  String? feacbook;
  String? tweter;
  String? inestgram;
  String? youtube;
  String? linkedin;
  String? googlePlus;
  String? wUp;
  String? phone1;
  String? phone2;
  String? fax;
  String? phoneCenter;
  String? pbox;
  String? reklam;
  String? siteMap;
  String? siteAddress;
  String? logo;
  String? favicon;
  String? editTime;
  String? mclose;
  String? mText;
  String? menuMode;
  String? contactEmp;
  String? coinId;
  String? addDate;
  String? archive;
  String? sort;
  String? vendorAct;
  String? aboutVendor;
  String? banner;
  String? vendorSet;


  VendorsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    vendorName = json['vendor_name'];
    vendorNameEn = json['vendor_name_en'];
    vendorNameTr = json['vendor_name_tr'];
    vendorEmail = json['vendor_email'];
    sclose = json['sclose'];
    stextclose = json['stextclose'];
    feacbook = json['feacbook'];
    tweter = json['tweter'];
    inestgram = json['inestgram'];
    youtube = json['youtube'];
    linkedin = json['linkedin'];
    googlePlus = json['google_plus'];
    wUp = json['w_up'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    fax = json['fax'];
    phoneCenter = json['phone_center'];
    pbox = json['pbox'];
    reklam = json['reklam'];
    siteMap = json['site_map'];
    siteAddress = json['site_address'];
    logo = json['logo'];
    favicon = json['favicon'];
    editTime = json['edit_time'];
    mclose = json['mclose'];
    mText = json['m_text'];
    menuMode = json['menu_mode'];
    contactEmp = json['contact_emp'];
    coinId = json['coin_id'];
    addDate = json['add_date'];
    archive = json['archive'];
    sort = json['sort'];
    vendorAct = json['vendor_act'];
    aboutVendor = json['about_vendor'];
    banner = json['banner'];
    vendorSet = json['vendor_set'];
  }

}