class CustomStreamError implements Exception {
  String type;
  String error;
  CustomStreamError({this.type, this.error});
}
