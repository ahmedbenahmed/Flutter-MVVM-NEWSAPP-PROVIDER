class Success {
  int code;
  Object response;
  Success({this.code, this.response});
}

class Failure {
  String errorResponse;
  Failure({this.errorResponse});
}
