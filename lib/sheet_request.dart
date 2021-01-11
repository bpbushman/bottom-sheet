class SheetRequest {
  final String label;
  final String description;
  final String buttonTitle;
  final bool listTaskToggle;

  SheetRequest({
    this.listTaskToggle,
    this.label,
    this.description,
    this.buttonTitle,
  });
}

class SheetResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;

  SheetResponse({this.fieldOne, this.fieldTwo, this.confirmed});
}
