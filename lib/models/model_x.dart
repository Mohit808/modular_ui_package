
class ModelX {
  ModelX({
      num? status, 
      bool? result, 
      String? message,}){
    _status = status;
    _result = result;
    _message = message;
}

  ModelX.fromJson(dynamic json) {
    _status = json['status'];
    _result = json['result'];
    _message = json['message'];
  }
  num? _status;
  bool? _result;
  String? _message;
ModelX copyWith({  num? status,
  bool? result,
  String? message,
}) => ModelX(  status: status ?? _status,
  result: result ?? _result,
  message: message ?? _message,
);
  num? get status => _status;
  bool? get result => _result;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['result'] = _result;
    map['message'] = _message;
    return map;
  }

}