import 'order_item_model.dart';

class OrdersList {
  List<OrderItemModel>? items;
  OrdersList({this.items});

  factory OrdersList.fromJson(Map<String, dynamic> json) => OrdersList(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
