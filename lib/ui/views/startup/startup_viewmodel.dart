import 'package:kitchy_store/ui/common/responsive_sizer.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<RouterService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    _navigationService.replaceWithDashboardView();

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
  }
}
