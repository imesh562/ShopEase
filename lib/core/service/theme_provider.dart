import 'package:flutter/foundation.dart';

import '../../features/data/datasources/shared_preference.dart';
import '../../utils/enums.dart';
import 'dependency_injection.dart';

class ThemeProvider with ChangeNotifier {
  final appSharedData = injection<AppSharedData>();
  changeMood(ThemeType value) {
    appSharedData.setTheme(value);
    notifyListeners();
  }
}
