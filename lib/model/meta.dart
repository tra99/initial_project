class Meta {
  int? total;
  dynamic next;
  dynamic prev;

  Meta({
    this.total,
    this.next,
    this.prev,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "next": next,
    "prev": prev,
  };
}