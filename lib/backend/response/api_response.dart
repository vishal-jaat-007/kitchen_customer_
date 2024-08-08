import 'package:tiffin_service_customer/view_model/enums/enums.dart';

class ApiReesponse<T> {
  String? message;
  T? data;
  ApiStatus? status;

  ApiReesponse({this.message, this.data, this.status});

  ApiReesponse.set() : status = ApiStatus.PENDING;
  ApiReesponse.complete({required this.data}) : status = ApiStatus.COMPLETE;
  ApiReesponse.error({required this.message}) : status = ApiStatus.ERROR;
  ApiReesponse.loading() : status = ApiStatus.LOADING;

  @override
  String toString() {
   
    return "{message : $message\ndata:$data\nstatus:$status}";
  }
}

