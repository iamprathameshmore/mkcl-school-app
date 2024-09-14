import '../../res/utils/constants/status.dart';

class Apiresponse<T> {
  Status? status;
  T? data;
  String? msg;

  Apiresponse(this.status, this.data, this.msg);

  Apiresponse.loading() : status = Status.LOADING;
  Apiresponse.complete() : status = Status.COMPLETE;
  Apiresponse.error() : status = Status.ERROR;

  @override
  String toString() {
    // TODO: implement toString
    return "Status: $status \n Data: $data \n Message: $msg";
  }
}
