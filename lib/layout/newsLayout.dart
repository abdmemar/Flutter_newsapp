import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: ( context,  state) {  },
        builder: ( context, state) {
          var cubit = NewsCubit.get(context) ;

          return  Scaffold(
            appBar: AppBar(
              title: Text(
                  'الجيش السوري الالكتورني'
              ),
              actions: [
                IconButton(onPressed: (){},
                    icon: Icon(Icons.search)) ,
                IconButton(onPressed: (){
                  NewsCubit.get(context).changeTheme() ;
                },
                    icon: Icon(Icons.brightness_4_outlined)) ,
              ],

            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,

              onTap: (index) {
                cubit.changeBottomNavBar(index) ;


              },
              items: cubit.bottomItems,
            ),

          );
        }


      ),
    );
  }
}
