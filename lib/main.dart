import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/newsLayout.dart';
import 'package:newsapp/shared/network/local/cash-helper.dart';
import 'package:newsapp/shared/network/remote/dio-helper.dart';

import 'layout/cubit/states.dart';





  void main() async {
    WidgetsFlutterBinding.ensureInitialized() ;

    DioHelper.init() ;
    await CashHelper.init() ;
    bool? isDark = CashHelper.getBoolean(key: 'isDark') ;

    runApp( MyApp(isDark));
  }



class MyApp extends StatelessWidget {
     bool? isDark ;
    MyApp(this.isDark) ;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> NewsCubit()..changeTheme(fromShared: isDark!),
      child: BlocConsumer <NewsCubit , NewsStates>
        (listener: (BuildContext context, state) {  },
        builder: (BuildContext context,  state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                  backgroundColor: Colors.white ,
                  elevation: 0 ,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white ,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold ,
                    fontSize: 20.0 ,

                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black ,

                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData (
                type: BottomNavigationBarType.fixed ,
                selectedItemColor:Colors.deepOrange ,
                unselectedItemColor: Colors.grey,
                backgroundColor:  Colors.white ,
              ),
              textTheme: TextTheme(
                //حسب حجم و نوع الخط
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600 ,
                  color: Colors.black ,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.black12,
              appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backgroundColor:  Colors.black12 ,
                  elevation: 0 ,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:  Colors.black12 ,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold ,
                    fontSize: 20.0 ,

                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white ,

                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData (
                type: BottomNavigationBarType.fixed ,
                selectedItemColor:Colors.deepOrange ,
                unselectedItemColor: Colors.grey,
                backgroundColor:  Colors.black12 ,
              ),
              textTheme: TextTheme(
                //حسب حجم و نوع الخط
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600 ,
                  color: Colors.white ,

                ),
              ),
            ) ,
            themeMode:   ThemeMode.dark ,

            home:  NewsLayout() ,
          );
        },

      ),
    );
  }
}

