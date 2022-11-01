import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends  ViewModelBuilderWidget<SplashViewModel>  {
  const SplashView({Key? key}) : super(key: key);


  @override
  Widget builder(BuildContext context, SplashViewModel viewModel, Widget? child) {
    return const Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel viewModel) => viewModel.init();
}