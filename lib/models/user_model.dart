
class UserModel {
  UserModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  UserModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
UserModel copyWith({  String? message,
  num? status,
  Data? data,
}) => UserModel(  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  num? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      String? token, 
      UserInfo? userInfo,}){
    _token = token;
    _userInfo = userInfo;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _userInfo = json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
  }
  String? _token;
  UserInfo? _userInfo;
Data copyWith({  String? token,
  UserInfo? userInfo,
}) => Data(  token: token ?? _token,
  userInfo: userInfo ?? _userInfo,
);
  String? get token => _token;
  UserInfo? get userInfo => _userInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_userInfo != null) {
      map['userInfo'] = _userInfo?.toJson();
    }
    return map;
  }

}

class UserInfo {
  UserInfo({
      num? id, 
      String? name, 
      String? email, 
      dynamic phoneNumber, 
      String? image, 
      num? userId,}){
    _id = id;
    _name = name;
    _email = email;
    _phoneNumber = phoneNumber;
    _image = image;
    _userId = userId;
}

  UserInfo.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _image = json['image'];
    _userId = json['user_id'];
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _phoneNumber;
  String? _image;
  num? _userId;
UserInfo copyWith({  num? id,
  String? name,
  String? email,
  dynamic phoneNumber,
  String? image,
  num? userId,
}) => UserInfo(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  image: image ?? _image,
  userId: userId ?? _userId,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get phoneNumber => _phoneNumber;
  String? get image => _image;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['image'] = _image;
    map['user_id'] = _userId;
    return map;
  }

}