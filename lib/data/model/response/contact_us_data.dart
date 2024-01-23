class ContactUsData {
  String? message;
  Data? data;

  ContactUsData({this.message, this.data});

  ContactUsData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['maplink'] = this.maplink;
    return data;
  }
}