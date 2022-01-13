class Object {
  int quantity;
  String info;

  Object({
    this.quantity = 0,
    this.info = ""
  });

  factory Object.fromJson(Map<String, dynamic> json) {
    return Object(
        quantity: json['quantity'],
        info: json['info']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['info'] = info;
    return data;
  }
}