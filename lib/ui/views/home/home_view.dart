import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/home/home_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel>{
  HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter starter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.title,
            ),
            Text(
              viewModel.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          viewModel.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  viewModelBuilder(BuildContext context) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}