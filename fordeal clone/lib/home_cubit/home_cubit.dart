import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart'as http;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:secondtask/home_cubit/home_states.dart';
import 'package:secondtask/local/cache_helper.dart';
import 'package:secondtask/models/ads_model.dart';
import 'package:secondtask/models/cats/main_categories_model.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../models/auth/login_model.dart';
import '../models/auth/register_model.dart';
import '../models/brands_models/brand_products_model.dart';
import '../models/brands_models/brands_model.dart';
import '../models/cats/8_cats/cats_8_model.dart';
import '../models/cats/8_cats/cats_8_model2.dart';
import '../models/cats/8_cats/cats_8_model3.dart';
import '../models/cats/8_cats/cats_8_model4.dart';
import '../models/products_models/home_products/country_maincategory_products_model.dart';
import '../models/cats/featured_cats.dart';
import '../models/cats/one_cat_model.dart';
import '../models/cats/sub_cats_model.dart';
import '../models/countries_models/countries_model.dart';
import '../models/countries_models/country_products.dart';
import '../models/favourites_models/favourite_model.dart';
import '../models/insert_country_model.dart';
import '../models/products_models/home_products/country_maincategory_products_model2.dart';
import '../models/products_models/home_products/country_maincategory_products_model3.dart';
import '../models/products_models/home_products/country_maincategory_products_model4.dart';
import '../models/products_models/similar_products_model.dart';
import '../models/products_models/single_product_model.dart';
import '../models/search/search_models.dart';
import '../models/slider_model.dart';
import '../models/vendors_models/one_vendor_model.dart';
import '../models/vendors_models/vendor_products_model.dart';
import '../models/vendors_models/vondors_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  static HomeCubit get(contaxt) => BlocProvider.of(contaxt);

  var searchController =TextFieldTagsController();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  var searchControllerTF=TextEditingController();

  int selectedCatsIndex=0 ;
  void setCatsListener(){
    itemPositionsListener.itemPositions.addListener(() {
      selectedCatsIndex= itemPositionsListener.itemPositions.value.map((e) => e.index).toList()[0];
      emit(HomeSetCatsListenerState());
    });
    print(selectedCatsIndex);



  }




  int selectedIndex = 0;

  void changeBottomNav(int value){

    selectedIndex=value;
    emit(HomeChangeBottomNavState());
  }


  void changeCat(int value){
    itemScrollController.scrollTo(
        index: value,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
    emit(HomeChangeCatsState());
  }

  AllBrands? allBrands;
  Future<void>getBrands()async{
    emit(HomeGetBrandsLoadingState());
    var uri =Uri.parse('https://alhasnaa.site/api/get_brands');
    await http.get(uri).then((value)async{
      print(value.body);
      allBrands=AllBrands.fromJson(await jsonDecode(value.body));
      print(allBrands!.data[0].catImg);
      emit(HomeGetBrandsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetBrandErrorState());
    });

  }
  MainCategoriesModel? mainCategoriesModel;

  Future<void>getMainCategories()async{
    emit(HomeGetMainCatsLoadingState());
    var uri =Uri.parse('https://alhasnaa.site/api/get_all_cats.php');
    await http.get(uri).then((value)async{
      print(value.body);
      mainCategoriesModel=MainCategoriesModel.fromJson(await jsonDecode(value.body));
      print(mainCategoriesModel!.data[0].catNameAr);

      getSubCategories(mainCategoriesModel!.data[0].id.toString());
      emit(HomeGetMainCatsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetMainCatsErrorState());
    });

  }

 List<String>tabsNames=[];
 List<String>tabIds=[];
 FeaturedCategoriesModel?featuredCategoriesModel;
  Future<void>getFeaturedCategories()async{
    tabsNames.clear();
    tabIds.clear();
    emit(HomeGetFeaturedCatsLoadingState());
    var uri =Uri.parse('https://alhasnaa.site/api/featured_categories');
    await http.get(uri).then((value)async{
      print(value.body);
      featuredCategoriesModel=FeaturedCategoriesModel.fromJson(await jsonDecode(value.body));
      print(featuredCategoriesModel!.data[0].catNameAr);
      featuredCategoriesModel!.data.forEach((element)  {{
        tabsNames.add(element.catNameAr.toString());
        tabIds.add(element.id.toString());
      }
      get8SubCategories(0);
        get8SubCategories(1);
        get8SubCategories(2);
        get8SubCategories(3);
        getCountryMainCategoryProducts(0);
        getCountryMainCategoryProducts(1);
        getCountryMainCategoryProducts(2);
        getCountryMainCategoryProducts(3);
      });
      print(tabsNames);
      emit(HomeGetFeaturedCatsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetFeaturedCatsErrorState());
    });

  }

  SubCatsModel?subCatsModel;
  Future<void>getSubCategories(String catId)async{
    emit(HomeGetSubCatsLoadingState());

    var uri =Uri.https('alhasnaa.site','/api/get_sub_cats',{
      'cat_id':catId,
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      subCatsModel=SubCatsModel.fromJson(await jsonDecode(value.body));
      print(subCatsModel!.data[0].catNameAr);
      emit(HomeGetSubCatsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetSubCatsErrorState());
    });

  }

 Sub8CatModel1?sub8catModel1;
 Sub8CatModel2?sub8catModel2;
 Sub8CatModel3?sub8catModel3;
 Sub8CatModel4?sub8catModel4;
  Future<void>get8SubCategories(int index)async{

    emit(HomeGet8CatsLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_8_sub_cats',{
      'cat_id':featuredCategoriesModel!.data[index].id,
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      if(index==0){
        sub8catModel1=Sub8CatModel1.fromJson(await jsonDecode(value.body));

      }else if(index==1){
        sub8catModel2=Sub8CatModel2.fromJson(await jsonDecode(value.body));
      }else if(index==2){
        sub8catModel3=Sub8CatModel3.fromJson(await jsonDecode(value.body));
      }else if(index==3){
        sub8catModel4=Sub8CatModel4.fromJson(await jsonDecode(value.body));
      }
      emit(HomeGet8CatsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGet8CatsErrorState());
    });

  }

  SlidersModel? slidersModel;
  Future<void>getSliders()async{
    emit(HomeGetSliderLoadingState());
    var uri =Uri.parse('https://alhasnaa.site/api/slider');
    await http.get(uri).then((value)async{
      print(value.body);
      slidersModel=SlidersModel.fromJson(await jsonDecode(value.body));
      print(slidersModel!.data[0].sliderPhoto);
      emit(HomeGetSliderSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetSliderErrorState());
    });

  }


  VendorsModel? vendorsModel;
  Future<void>getVendors()async{
    emit(HomeGetVendorsLoadingState());
    var uri =Uri.parse('https://alhasnaa.site/api/get_vendors');
    await http.get(uri).then((value)async{
      print(value.body);
      vendorsModel=VendorsModel.fromJson(await jsonDecode(value.body));
      print(vendorsModel!.data[0].feacbook);
      emit(HomeGetVendorsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetVendorsErrorState());
    });

  }



  AdsModel? adsModel;
  Future<void>getAds()async{
    emit(HomeGetAdsLoadingState());
    var uri =Uri.parse('https://alhasnaa.site/api/ads');
    await http.get(uri).then((value)async{
      print(value.body);
      adsModel=AdsModel.fromJson(await jsonDecode(value.body));
      print(adsModel!.data[0].titleAr);
      emit(HomeGetAdsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetAdsErrorState());
    });

  }
   CountriesModel? countriesModel;
    Future<void>getCountries()async{
    emit(HomeGetCountriesLoadingState());
    var uri =Uri.parse('https://alhasnaa.site/api/get_countries');
    await http.get(uri).then((value)async{
      print(value.body);
      countriesModel=CountriesModel.fromJson(await jsonDecode(value.body));
      print(countriesModel!.data[0].countryName);
      emit(HomeGetCountriesSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetCountriesErrorState());
    });

  }

//   RegisterModel? registerModel;
// Future<void>register(String email,String phone,String name,String country ,String countryZip,String password)async{
//     emit(HomeRegisterLoadingState());
//     var uri =Uri.https('alhasnaa.site','/api/registration',{
//       'user_name':name,
//       'country':country,
//       'country_zip':countryZip,
//       'user_phone':phone,
//       'user_mail':email,
//       'password':password
//
//     } );
//     await http.get(uri).then((value)async{
//       print(value.body);
//       registerModel=RegisterModel.fromJson(await jsonDecode(value.body));
//       print(registerModel!.userMail);
//       emit(HomeRegisterSuccessState());
//
//     }).catchError((e){
//       print(e.toString());
//       emit(HomeRegisterErrorState());
//     });
//
//   }
//

FavouritesModel?favouritesModel;
Future<void>getFavourites(String uid)async{
    emit(HomeGetFavouritesLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_favorite_products',{
      'user_id':uid,
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      favouritesModel=FavouritesModel.fromJson(await jsonDecode(value.body));
      print(favouritesModel!.data[0].brandId);
      emit(HomeGetFavouritesSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetFavouritesErrorState());
    });

  }



  VendorProductsModel?vendorProductsModel;
Future<void>getVendorProducts(String vendorId)async{
  vendorProductsModel=null;
    emit(HomeGetVendorProductsLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_vendor_products',{
      'vendor_id':vendorId,
      'country_id':CacheHelper.getData(key: 'countryId')
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      vendorProductsModel=VendorProductsModel.fromJson(await jsonDecode(value.body));
      print(vendorProductsModel!.data[0].brandId);
      emit(HomeGetVendorProductsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetVendorProductsErrorState());
    });

  }



  SearchModel?searchModel;
Future<void>search(String value)async{
  searchModel=null;
    emit(HomeSearchLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/search.php',{
      'tag':value,
      'country_id':CacheHelper.getData(key: 'countryId')
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      searchModel=SearchModel.fromJson(await jsonDecode(value.body));
      print(searchModel!.data[0].brandId);
      emit(HomeSearchSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeSearchErrorState());
    });

  }



  OneVendorModel? oneVendorModel;
Future<void>getOneVendor(String vendorId)async{
    emit(HomeGetOneVendorLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_one_vendor',{
      'vendor_id':vendorId,
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      oneVendorModel=OneVendorModel.fromJson(await jsonDecode(value.body));
      print(oneVendorModel!.id);
      emit(HomeGetOneVendorSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetOneVendorErrorState());
    });

  }





  CountryProductsModel?countryProductsModel;
Future<void>getCountryProducts()async{
    emit(HomeGetCountryProductsLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_country_products',{
      'country_id':CacheHelper.getData(key: 'countryId')
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      countryProductsModel=CountryProductsModel.fromJson(await jsonDecode(value.body));
      print(countryProductsModel!.data[0].brandId);
      emit(HomeGetCountryProductsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetCountryProductsErrorState());
    });

  }


  SingleProductModel?singleProductModel;

Future<void>getSingleProduct(String prodId)async{
  singleProductModel=null;
    emit(HomeGetSingleProductsLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_prod_data',{
      'prod_id':prodId
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      singleProductModel=SingleProductModel.fromJson(await jsonDecode(value.body)[0]);
      print(singleProductModel!.images[0]);
      emit(HomeGetSingleProductsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetSingleProductsErrorState());
    });

  }

  InsertCountryLangModel?insertCountryLangModel;
Future<void>insertCountryLang(String uid,String countryId,String lang,String latitude,String longitude,String macAddress)async{
    emit(HomeInsertCountryLangLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/insert_user_country_lang',{
      'user_id':uid,
      'country_id':countryId,
      'lang':lang,
      'latitude':latitude,
      'longitude':longitude,
      'mac_address':macAddress
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      insertCountryLangModel=InsertCountryLangModel.fromJson(await jsonDecode(value.body));
      print(insertCountryLangModel!.lang);
      emit(HomeInsertCountryLangSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeInsertCountryLangErrorState());
    });

  }


  SimilarProductsModel?similarProductsModel;
Future<void>getSimilarProduct(String prodId)async{
    emit(HomeGetSimilarProductsLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_similar_products',{
      'prod_id':prodId,
      'country_id':CacheHelper.getData(key: 'countryId')
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      similarProductsModel=SimilarProductsModel.fromJson(await jsonDecode(value.body));
      print(similarProductsModel!.data[0].id);
      emit(HomeGetSimilarProductsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetSimilarProductsErrorState());
    });

  }


  BrandProductsModel?brandProductsModel;
Future<void>getBrandProducts(String brandId)async{
    emit(HomeGetBrandProductsLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_brand_products',{
      'brand_id':brandId,
      'country_id':CacheHelper.getData(key: 'countryId')
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      brandProductsModel=BrandProductsModel.fromJson(await jsonDecode(value.body));
      print(brandProductsModel!.data[0].brandId);
      emit(HomeGetBrandProductsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetBrandProductsErrorState());
    });

  }



  OneCategoryModel? oneCategoryModel;
Future<void>getOneCat(String catId)async{
    emit(HomeGetOneCatsLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_one_cat',{
      'cat_id':catId
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      oneCategoryModel=OneCategoryModel.fromJson(await jsonDecode(value.body));
      print(oneCategoryModel!.data[0].catNameAr);
      emit(HomeGetOneCatSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetOneCatErrorState());
    });

  }



  CountryMainCategoryProductsModel1? countryMainCategoryProductsModel1;
  CountryMainCategoryProductsModel2? countryMainCategoryProductsModel2;
  CountryMainCategoryProductsModel3? countryMainCategoryProductsModel3;
  CountryMainCategoryProductsModel4? countryMainCategoryProductsModel4;
Future<void>getCountryMainCategoryProducts(int index)async{
    emit(HomeGetCountryMainCatProductsLoadingState());
    var uri =Uri.https('alhasnaa.site','/api/get_country_maincategory_products',{
      'cat_id':featuredCategoriesModel!.data[index].id,
      'country_id':CacheHelper.getData(key: 'countryId')
    } );
    await http.get(uri).then((value)async{
      print(value.body);
      if(index==0){
        countryMainCategoryProductsModel1=CountryMainCategoryProductsModel1.fromJson(await jsonDecode(value.body));

      }else if(index==1){
        countryMainCategoryProductsModel2=CountryMainCategoryProductsModel2.fromJson(await jsonDecode(value.body));

      }else if(index==2){
        countryMainCategoryProductsModel3=CountryMainCategoryProductsModel3.fromJson(await jsonDecode(value.body));

      }else if(index==3){
        countryMainCategoryProductsModel4=CountryMainCategoryProductsModel4.fromJson(await jsonDecode(value.body));

      }
      emit(HomeGetCountryMainCatProductsSuccessState());

    }).catchError((e){
      print(e.toString());
      emit(HomeGetCountryMainCatProductsErrorState());
    });

  }



// LoginModel?loginModel;
// Future<void>login(String emailPhone,String password)async{
//     emit(HomeLoginLoadingState());
//     var uri =Uri.https('alhasnaa.site','/api/login',{
//       'phone_email':emailPhone,
//       'password':password
//
//     } );
//     await http.get(uri).then((value)async{
//       print(value.body);
//       loginModel=LoginModel.fromJson(await jsonDecode(value.body));
//       print(loginModel!.userMail);
//       emit(HomeLoginSuccessState());
//
//     }).catchError((e){
//       print(e.toString());
//       emit(HomeLoginErrorState());
//     });
//
//   }


}