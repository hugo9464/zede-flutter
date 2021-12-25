class Weighing {
  final String id;
  final num weight;
  final String type;
  final String userId;

  Weighing({
    required this.id,
    required this.weight,
    required this.type,
    required this.userId,
  });

  factory Weighing.fromJson(Map<String, dynamic> json) {
    return Weighing(
      id: json['_id'],
      weight: json['weight'],
      type: json['type'],
      userId: json['userId'],
    );
  }
}
