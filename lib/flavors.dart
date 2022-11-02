enum Flavor {
  DEV,
  QA,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Flutter Starter Kit Dev';
      case Flavor.QA:
        return 'Flutter Starter Kit QA';
      default:
        return 'title';
    }
  }

}
