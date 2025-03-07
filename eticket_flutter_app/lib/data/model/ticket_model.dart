class TicketModel {
  final String title;
  final String subtitle;
  final int price;
  int count = 0;
  int totalPrice = 0;

  TicketModel({
    required this.title,
    required this.subtitle,
    required this.price,
  });
}
