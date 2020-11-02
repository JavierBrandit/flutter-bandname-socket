class Band {
  String id;
  String names;
  int votes;

  Band({this.id, this.names, this.votes});

  factory Band.fromMap(Map<String, dynamic> obj) => Band(
        id: obj['id'],
        names: obj['names'],
        votes: obj['votes'],
      );
}
