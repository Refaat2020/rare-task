class FailureModel {
  FailureModel({
    required this.state,
    required this.message,
    required this.data,
  });
  late final int state;
  late final String message;
  late final String data;

  FailureModel.fromJson(Map<String, dynamic> json){
    state = json['state'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['state'] = state;
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}