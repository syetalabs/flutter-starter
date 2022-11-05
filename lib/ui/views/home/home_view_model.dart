import 'package:flutter_starter/core/config/router.router.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel{

  final NavigationService _navigationService = GetIt.I.get();
  int counter = 0;
  HomeViewModel();

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void goForm(){
    _navigationService.navigateTo(Routes.sampleFormView);
  }

  void init() async {}

}