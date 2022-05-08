class SlidersModel{
  List<SliderDataModel>data=[];
  SlidersModel.fromJson(var json){
  json.forEach((element) {
  data.add(SliderDataModel.fromJson(element));
  });
  }
}
class SliderDataModel {
  String? sliderId;
  String? userId;
  String? compId;
  String? tarteb;
  String? sliderPhoto;
  String? text1Ar;
  String? text2Ar;
  String? text3Ar;
  String? text1En;
  String? text2En;
  String? text3En;
  String? text1Tr;
  String? text2Tr;
  String? text3Tr;
  String? btnUrl;
  String? sliderSet;



  SliderDataModel.fromJson(Map<String, dynamic> json) {
    sliderId = json['slider_id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    tarteb = json['tarteb'];
    sliderPhoto = json['slider_photo'];
    text1Ar = json['text_1_ar'];
    text2Ar = json['text_2_ar'];
    text3Ar = json['text_3_ar'];
    text1En = json['text_1_en'];
    text2En = json['text_2_en'];
    text3En = json['text_3_en'];
    text1Tr = json['text_1_tr'];
    text2Tr = json['text_2_tr'];
    text3Tr = json['text_3_tr'];
    btnUrl = json['btn_url'];
    sliderSet = json['slider_set'];
  }


}