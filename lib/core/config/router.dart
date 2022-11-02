import 'package:flutter_starter/ui/views/home/home_view.dart';
import 'package:flutter_starter/ui/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: SplashView,),
  AdaptiveRoute(page: HomeView,initial: true),
])

class $Router {}