class MyObject {
  int quantity;
  String info;

  MyObject({this.quantity = 0, this.info = ""});

  factory MyObject.fromJson(Map<String, dynamic> json) {
    return MyObject(quantity: json['quantity'], info: json['info']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['info'] = info;
    return data;
  }
}
