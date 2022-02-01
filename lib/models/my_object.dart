class MyObject {
  String name;
  int id;
  int quantity;
  String info;

  MyObject({
    required this.name,
    required this.id,
    this.quantity = 0,
    this.info = "",
  });

  factory MyObject.fromJson(Map<String, dynamic> json) {
    return MyObject(
      name: json['name'],
      quantity: int.parse(json['quantity']),
      id: int.parse(json['id']),
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
        '", "id": "' +
        id.toString() +
        '", "quantity": "' +
        quantity.toString() +
        '", "info": "' +
        info +
        '"}';
  }
}
