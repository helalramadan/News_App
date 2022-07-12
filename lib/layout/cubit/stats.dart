abstract class NewsState {}

class NewInitiialState extends NewsState {}

class BottomSheetState extends NewsState {}

class BusinessLoadingState extends NewsState {}

class BusinessGetDataSuccessState extends NewsState {}

class BusinessGetDataErrorState extends NewsState {
  final error;

  BusinessGetDataErrorState(this.error);
}

class ScienceLoadingState extends NewsState {}

class ScienceGetDataSuccessState extends NewsState {}

class ScienceGetDataErrorState extends NewsState {
  final error;

  ScienceGetDataErrorState(this.error);
}


class SportsLoadingState extends NewsState {}

class SportsGetDataSuccessState extends NewsState {}

class SportsGetDataErrorState extends NewsState {
  final error;

  SportsGetDataErrorState(this.error);
}

class SearchLoadingState extends NewsState {}

class SearchGetDataSuccessState extends NewsState {}

class SearchGetDataErrorState extends NewsState {
  final error;

  SearchGetDataErrorState(this.error);
}
