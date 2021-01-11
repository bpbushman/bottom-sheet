library bottom_sheet;

import 'dart:async';
import 'package:bottom_sheet/sheet_request.dart';

class BottomSheetService {
  Function(SheetRequest) _bottomSheetListener;
  Completer<SheetResponse> _bottomSheetCompleter;

  void registerBottomSheetListener(Function(SheetRequest) bottomSheetListener) {
    _bottomSheetListener = bottomSheetListener;
  }

  Future<SheetResponse> showBottomSheet(
      {String description,
      String label,
      String buttonTitle = 'ok',
      bool toggle}) {
    _bottomSheetCompleter = Completer<SheetResponse>();
    _bottomSheetListener(SheetRequest(
        label: label,
        description: description,
        buttonTitle: buttonTitle,
        listTaskToggle: toggle));
    return _bottomSheetCompleter.future;
  }

  void bottomSheetComplete(SheetResponse response) {
    _bottomSheetCompleter.complete(response);
    _bottomSheetCompleter = null;
  }
}
