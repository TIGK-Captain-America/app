/// Custom Error to display in ErrorView
class CustomStreamError implements Exception {
  String type;
  String error;
  CustomStreamError({this.type, this.error});
}
