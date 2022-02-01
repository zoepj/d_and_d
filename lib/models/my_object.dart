class MyObject {
  String name;
  int quantity;
  String info;

  MyObject({
    required this.name,
    this.quantity = 0,
    this.info = "",
  });

  factory MyObject.fromJson(Map<String, dynamic> json) {
    return MyObject(
      name: json['name'],
      quantity: int.parse(json['quantity']),
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['info'] = info;
    return data;
  }

  @override
  String toString() {
    return '{"name": "' +
        name +
        '", "quantity": "' +
        quantity.toString() +
        '", "info": "' +
        info +
        '"}';
  }
}
