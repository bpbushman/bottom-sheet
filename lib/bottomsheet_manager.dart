import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:bottom_sheet/locator.dart';
import 'package:bottom_sheet/sheet_request.dart';
import 'package:flutter/material.dart';

class BottomSheetManager extends StatefulWidget {
  final Widget child;
  BottomSheetManager({Key key, this.child}) : super(key: key);

  _BottomSheetManagerState createState() => _BottomSheetManagerState();
}

class _BottomSheetManagerState extends State<BottomSheetManager> {
  BottomSheetService _sheetService = locator<BottomSheetService>();
  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _sheetService.registerBottomSheetListener(_showBottomSheet);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  _showBottomSheet(SheetRequest request) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      '${request.label}',
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                          hintText: '${request.description}',
                          suffix: GestureDetector(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                              onPressed: () {
                                _sheetService.bottomSheetComplete(SheetResponse(
                                  fieldOne: myController.text,
                                ));
                                myController.clear();
                                Navigator.of(context).pop();
                              },
                            ),
                          )),
                      autofocus: true,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ));
  }
}
