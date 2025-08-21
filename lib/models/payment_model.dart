class PaymentModel {
  String cardId;
  String userId;
  String cardNumber;
  String expiry;
  String cardHolder;
  String cvv;

  PaymentModel({
    this.cardId = '',
    this.userId = '',
    required this.cardNumber,
    required this.expiry,
    required this.cardHolder,
    required this.cvv,
  });

  PaymentModel.fromJson(Map<String, dynamic> json, String id)
      : this(
          cardId: id,
          userId: json['userId'],
          cardNumber: json['cardNumber'],
          expiry: json['expiry'],
          cardHolder: json['cardHolder'],
          cvv: json['cvv'],
        );

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'cardNumber': cardNumber,
      'expiry': expiry,
      'cardHolder': cardHolder,
      'cvv': cvv,
    };
  }
}
