class AddressModel {
  final String id;
  final String userId;
  final String addresstitle;
  final String contactName;
  final String houseNo;
  final String contactNumber;

  AddressModel({
    required this.id,
    required this.userId,
    required this.addresstitle,
    required this.contactName,
    required this.houseNo,
    required this.contactNumber,
  });
  factory AddressModel.fromMap(Map<String, dynamic> data, String id) {
    return AddressModel(
      id: id,
      userId: data['userId'] ?? '',
      addresstitle: data['addresstitle'] ?? '',
      contactName: data['contactName'] ?? '',
      houseNo: data['houseNo'] ?? '',
      contactNumber: data['contactNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'addresstitle': addresstitle,
      'contactName': contactName,
      'houseNo': houseNo,
      'contactNumber': contactNumber,
    };
  }

  AddressModel copyWith({
    String? id,
    String? userId,
    String? addresstitle,
    String? contactName,
    String? houseNo,
    String? contactNumber,
  }) {
    return AddressModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      addresstitle: addresstitle ?? this.addresstitle,
      contactName: contactName ?? this.contactName,
      houseNo: houseNo ?? this.houseNo,
      contactNumber: contactNumber ?? this.contactNumber,
    );
  }
}
