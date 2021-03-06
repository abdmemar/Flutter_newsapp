abstract class NewsStates {}

class InitState extends NewsStates {}

class BottomNavState extends NewsStates {}

class ChangeBottomNavBarState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error ;
  NewsGetBusinessErrorState(this.error) ;
}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error ;
  NewsGetSportsErrorState(this.error) ;
}

class NewsGetSportsLoadingState extends NewsStates {}



class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error ;
  NewsGetScienceErrorState(this.error) ;
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsChangeModeState extends NewsStates {}