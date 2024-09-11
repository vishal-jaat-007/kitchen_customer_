import 'package:tiffin_service_customer/view_model/model/auth/UserModel.dart';

class Ordermodel {
  String? orderid;
  String? orderdiscount;
  String? orderprice;
  Usermodel? usermodel;

  Ordermodel(
      {this.orderid, this.orderdiscount, this.orderprice, this.usermodel});

  Map<String, dynamic> tojson() => {
        "orderid": orderid,
        "orderdiscount": orderdiscount,
        "orderprice": orderprice,
        "usermodel": usermodel
      };

  Ordermodel.fromjson(Map<String, dynamic> map, String orderid)
      : orderid = orderid,
        orderdiscount = map['orderdiscount'],
        orderprice = map['orderprice'],
        usermodel = map['usermodel'] != null
            ? Usermodel.fromJson(map['usermodel'], map["id"])
            : null;

  Ordermodel copyWith({
    String? orderid,
    String? orderdiscount,
    String? orderprice,
    Usermodel? usermodel,
  }) {
    return Ordermodel(
      orderid: orderid ?? this.orderid,
      orderdiscount: orderdiscount ?? this.orderdiscount,
      orderprice: orderprice ?? this.orderprice,
      usermodel: usermodel ?? this.usermodel,
    );
  }
}
