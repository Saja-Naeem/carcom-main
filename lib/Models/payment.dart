class Payment {
  int paymentId;
  DateTime paymentDate;
  String paymentMethod;
  String credName;
  int credNumber;
  double discount;
  double totalPrice;

  Payment({
    required this.paymentId,
    required this.paymentDate,
    required this.paymentMethod,
    required this.credName,
    required this.credNumber,
    required this.discount,
    required this.totalPrice,
  });

  void viewPayment() {}
  void makePayment() {}
  void returnPayment() {}
  void calculateTotalAmount() {}
  void displayErrorMessage() {}
  void validateCard() {}
  void calculateDelayFine() {}
  void calculateMileageFine() {}
  void calculateCancelFine() {}
  void calculateDamageFine() {}
  void calculateDiscount() {}
}
