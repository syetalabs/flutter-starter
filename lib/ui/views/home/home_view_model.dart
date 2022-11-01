import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  int counter = 0;
  HomeViewModel();

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void init() async {

  }
}