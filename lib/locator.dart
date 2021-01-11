import 'package:get_it/get_it.dart';
import 'bottom_sheet.dart';

final locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => BottomSheetService());
}
