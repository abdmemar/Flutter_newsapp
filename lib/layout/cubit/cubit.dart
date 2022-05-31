import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/models/business/business-screen.dart';
import 'package:newsapp/models/science/science-screen.dart';
import 'package:newsapp/models/settings/settings.dart';
import 'package:newsapp/models/sport/sport-screen.dart';
import 'package:newsapp/shared/network/local/cash-helper.dart';
import 'package:newsapp/shared/network/remote/dio-helper.dart';

class NewsCubit extends Cubit<NewsStates> {

 NewsCubit() :super(InitState()) ;

 static NewsCubit get(context) => BlocProvider.of(context) ;

 int currentIndex = 0 ;


 List<BottomNavigationBarItem> bottomItems =[
   BottomNavigationBarItem(
     icon: Icon(
       Icons.business ,
     ),
     label : ' عالمية'
   ) ,
   BottomNavigationBarItem(
       icon: Icon(
         Icons.science ,
       ),
       label : 'محلية '
   ) ,
   BottomNavigationBarItem(
       icon: Icon(
         Icons.sports ,
       ),
       label : 'دمشق و ريفها '
   ) ,

 ];
 List<Widget> screens = [
   Business() ,
   Science() ,
   Sport() ,


 ] ;
 void changeBottomNavBar (index) {
   currentIndex = index ;
   emit(ChangeBottomNavBarState()) ;
 }
 List <dynamic> business = [] ;

 void getBusiness () {
   emit(NewsGetBusinessLoadingState()) ; 
   DioHelper.getData(url: 'v2/top-headlines', query: {
     'country' : 'eg' ,
     'category' : 'business' ,
     'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca' ,
   }).then((value) {
     emit(NewsGetBusinessSuccessState());
     business = value.data['articles'] ;
     print (business[0]['title']) ;
   }).catchError((error) {
     emit(NewsGetBusinessErrorState(error));
     print(error.toString()) ;
   } );
 }
 List<dynamic> sports = [];

 void getSports()
 {
   emit(NewsGetSportsLoadingState());

   if(sports.length == 0)
   {
     DioHelper.getData(
       url: 'v2/top-headlines',
       query:
       {
         'country':'eg',
         'category':'sports',
         'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
       },
     ).then((value)
     {
       //print(value.data['articles'][0]['title']);
       sports = value.data['articles'];
       print(sports[0]['title']);

       emit(NewsGetSportsSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetSportsErrorState(error.toString()));
     });
   } else
   {
     emit(NewsGetSportsSuccessState());
   }
 }

 List<dynamic> science = [];

 void getScience()
 {
   emit(NewsGetScienceLoadingState());

   if(science.length == 0)
   {
     DioHelper.getData(
       url: 'v2/top-headlines',
       query:
       {
         'country':'eg',
         'category':'science',
         'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
       },
     ).then((value)
     {
       //print(value.data['articles'][0]['title']);
       science = value.data['articles'];
       print(science[0]['title']);

       emit(NewsGetScienceSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetScienceErrorState(error.toString()));
     });
   } else
   {
     emit(NewsGetScienceSuccessState());
   }
 }
 bool isDark = false ;

 void changeTheme ({bool? fromShared}) {
   //حطينا هون بارامتر و عملناه اختياري لأن لما بدي استدعيه من من الزر أول مرة ما رح يكون شايل قيمة

   isDark= !isDark ;
   emit(NewsChangeModeState()) ;

   /* if (fromShared != null) {
     isDark = fromShared ;
     emit(NewsChangeModeState()) ;
   } else
    {
     isDark = !isDark ;


     CashHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
       emit(NewsChangeModeState()) ;
     }) ;
   }*/



 }
}

