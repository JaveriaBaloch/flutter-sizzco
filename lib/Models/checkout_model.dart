// class CheckoutModel {
//   int? _customerId;
//   String? _total;
//   List<LineItems>? _lineItems;
//   String? _paymentMethod;
//   String? _paymentMethodTitle;
//   bool? _setPaid;
//   String? _status;
//   Billing? _billing;
//   Billing? _shipping;
//
//   CheckoutModel(
//       {int? customerId,
//         String? total,
//         List<LineItems>? lineItems,
//         String? paymentMethod,
//         String? paymentMethodTitle,
//         bool? setPaid,
//         String? status,
//         Billing? billing,
//         Billing? shipping}) {
//     if (customerId != null) {
//       this._customerId = customerId;
//     }
//     if (total != null) {
//       this._total = total;
//     }
//     if (lineItems != null) {
//       this._lineItems = lineItems;
//     }
//     if (paymentMethod != null) {
//       this._paymentMethod = paymentMethod;
//     }
//     if (paymentMethodTitle != null) {
//       this._paymentMethodTitle = paymentMethodTitle;
//     }
//     if (setPaid != null) {
//       this._setPaid = setPaid;
//     }
//     if (status != null) {
//       this._status = status;
//     }
//     if (billing != null) {
//       this._billing = billing;
//     }
//     if (shipping != null) {
//       this._shipping = shipping;
//     }
//   }
//
//   int? get customerId => _customerId;
//   set customerId(int? customerId) => _customerId = customerId;
//   String? get total => _total;
//   set total(String? total) => _total = total;
//   List<LineItems>? get lineItems => _lineItems;
//   set lineItems(List<LineItems>? lineItems) => _lineItems = lineItems;
//   String? get paymentMethod => _paymentMethod;
//   set paymentMethod(String? paymentMethod) => _paymentMethod = paymentMethod;
//   String? get paymentMethodTitle => _paymentMethodTitle;
//   set paymentMethodTitle(String? paymentMethodTitle) =>
//       _paymentMethodTitle = paymentMethodTitle;
//   bool? get setPaid => _setPaid;
//   set setPaid(bool? setPaid) => _setPaid = setPaid;
//   String? get status => _status;
//   set status(String? status) => _status = status;
//   Billing? get billing => _billing;
//   set billing(Billing? billing) => _billing = billing;
//   Billing? get shipping => _shipping;
//   set shipping(Billing? shipping) => _shipping = shipping;
//
//   CheckoutModel.fromJson(Map<String, dynamic> json) {
//     _customerId = json['customer_id'];
//     _total = json['total'];
//     if (json['line_items'] != null) {
//       _lineItems = <LineItems>[];
//       json['line_items'].forEach((v) {
//         _lineItems!.add(new LineItems.fromJson(v));
//       });
//     }
//     _paymentMethod = json['payment_method'];
//     _paymentMethodTitle = json['payment_method_title'];
//     _setPaid = json['set_paid'];
//     _status = json['status'];
//     _billing =
//     json['billing'] != null ? new Billing.fromJson(json['billing']) : null;
//     _shipping = json['shipping'] != null
//         ? new Billing.fromJson(json['shipping'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['customer_id'] = this._customerId;
//     data['total'] = this._total;
//     if (this._lineItems != null) {
//       data['line_items'] = this._lineItems!.map((v) => v.toJson()).toList();
//     }
//     data['payment_method'] = this._paymentMethod;
//     data['payment_method_title'] = this._paymentMethodTitle;
//     data['set_paid'] = this._setPaid;
//     data['status'] = this._status;
//     if (this._billing != null) {
//       data['billing'] = this._billing!.toJson();
//     }
//     if (this._shipping != null) {
//       data['shipping'] = this._shipping!.toJson();
//     }
//     return data;
//   }
// }
//
// class LineItems {
//   int? _productId;
//   int? _quantity;
//   int? _price;
//
//   LineItems({int? productId, int? quantity, int? price}) {
//     if (productId != null) {
//       this._productId = productId;
//     }
//     if (quantity != null) {
//       this._quantity = quantity;
//     }
//     if (price != null) {
//       this._price = price;
//     }
//   }
//
//   int? get productId => _productId;
//   set productId(int? productId) => _productId = productId;
//   int? get quantity => _quantity;
//   set quantity(int? quantity) => _quantity = quantity;
//   int? get price => _price;
//   set price(int? price) => _price = price;
//
//   LineItems.fromJson(Map<String, dynamic> json) {
//     _productId = json['product_id'];
//     _quantity = json['quantity'];
//     _price = json['price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_id'] = this._productId;
//     data['quantity'] = this._quantity;
//     data['price'] = this._price;
//     return data;
//   }
// }
//
// class Billing {
//   String? _firstName;
//   String? _lastName;
//   String? _address1;
//   String? _city;
//   String? _state;
//   String? _postcode;
//   String? _country;
//
//   Billing(
//       {String? firstName,
//         String? lastName,
//         String? address1,
//         String? city,
//         String? state,
//         String? postcode,
//         String? country, required String email}) {
//     if (firstName != null) {
//       this._firstName = firstName;
//     }
//     if (lastName != null) {
//       this._lastName = lastName;
//     }
//     if (address1 != null) {
//       this._address1 = address1;
//     }
//     if (city != null) {
//       this._city = city;
//     }
//     if (state != null) {
//       this._state = state;
//     }
//     if (postcode != null) {
//       this._postcode = postcode;
//     }
//     if (country != null) {
//       this._country = country;
//     }
//   }
//
//   String? get firstName => _firstName;
//   set firstName(String? firstName) => _firstName = firstName;
//   String? get lastName => _lastName;
//   set lastName(String? lastName) => _lastName = lastName;
//   String? get address1 => _address1;
//   set address1(String? address1) => _address1 = address1;
//   String? get city => _city;
//   set city(String? city) => _city = city;
//   String? get state => _state;
//   set state(String? state) => _state = state;
//   String? get postcode => _postcode;
//   set postcode(String? postcode) => _postcode = postcode;
//   String? get country => _country;
//   set country(String? country) => _country = country;
//
//   Billing.fromJson(Map<String, dynamic> json) {
//     _firstName = json['first_name'];
//     _lastName = json['last_name'];
//     _address1 = json['address_1'];
//     _city = json['city'];
//     _state = json['state'];
//     _postcode = json['postcode'];
//     _country = json['country'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first_name'] = this._firstName;
//     data['last_name'] = this._lastName;
//     data['address_1'] = this._address1;
//     data['city'] = this._city;
//     data['state'] = this._state;
//     data['postcode'] = this._postcode;
//     data['country'] = this._country;
//     return data;
//   }
// }
class ProductItem {
  int productId;
  int quantity;

  ProductItem({
    required this.productId,
    required this.quantity,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      productId: json['product_id'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
