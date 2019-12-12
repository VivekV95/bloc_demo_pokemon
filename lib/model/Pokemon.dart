class Pokemon {
  String _name;
  Sprites _sprites;
  List<Moves> _moves;

  Pokemon({String name, Sprites sprites, List<Moves> moves}) {
    this._name = name;
    this._sprites = sprites;
    this._moves = moves;
  }

  String get name => _name;
  set name(String name) => _name = name;
  Sprites get sprites => _sprites;
  set sprites(Sprites sprites) => _sprites = sprites;
  List<Moves> get moves => _moves;
  set moves(List<Moves> moves) => _moves = moves;

  Pokemon.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    if (json['moves'] != null) {
      _moves = new List<Moves>();
      json['moves'].forEach((v) {
        _moves.add(new Moves.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    if (this._sprites != null) {
      data['sprites'] = this._sprites.toJson();
    }
    if (this._moves != null) {
      data['moves'] = this._moves.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sprites {
  String _frontDefault;

  Sprites({String frontDefault}) {
    this._frontDefault = frontDefault;
  }

  String get frontDefault => _frontDefault;
  set frontDefault(String frontDefault) => _frontDefault = frontDefault;

  Sprites.fromJson(Map<String, dynamic> json) {
    _frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this._frontDefault;
    return data;
  }
}

class Moves {
  Move _move;

  Moves({Move move}) {
    this._move = move;
  }

  Move get move => _move;
  set move(Move move) => _move = move;

  Moves.fromJson(Map<String, dynamic> json) {
    _move = json['move'] != null ? new Move.fromJson(json['move']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._move != null) {
      data['move'] = this._move.toJson();
    }
    return data;
  }
}

class Move {
  String _name;

  Move({String name}) {
    this._name = name;
  }

  String get name => _name;
  set name(String name) => _name = name;

  Move.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    return data;
  }
}
