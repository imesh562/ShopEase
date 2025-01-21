import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

import '../features/presentation/views/checkout/checkout_view.dart';
import '../features/presentation/views/dashboard/dashboard.dart';
import '../features/presentation/views/product_details/product_details_view.dart';
import '../features/presentation/views/splash/splash_view.dart';

class Routes {
  static const String kSplashView = "kSplashView";
  static const String kDashboardView = "kDashboardView";
  static const String kProductDetailsView = "kProductDetailsView";
  static const String kCheckOutView = "kCheckOutView";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kSplashView:
        return PageTransition(
            child: SplashView(), type: PageTransitionType.fade);
      case Routes.kDashboardView:
        return PageTransition(
            child: DashboardView(
              tab: settings.arguments != null ? settings.arguments as int : 1,
            ),
            type: PageTransitionType.fade);
      case Routes.kProductDetailsView:
        return PageTransition(
            child: ProductDetailsView(
              product: settings.arguments as Product,
            ),
            type: PageTransitionType.fade);
      case Routes.kCheckOutView:
        return PageTransition(
            child: CheckOutView(), type: PageTransitionType.fade);
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}
