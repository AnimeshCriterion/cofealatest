class ContactUsData {
  String? message;
  Data? data;

  ContactUsData({this.message, this.data});

  ContactUsData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? address;
  String? email;
  String? phone;
  String? maplink;

  Data({this.address, this.email, this.phone, this.maplink});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    maplink = json['maplink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['email'] = email;
    data['phone'] = phone;
    data['maplink'] = maplink;
    return data;
  }
}