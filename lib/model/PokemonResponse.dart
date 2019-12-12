class PokemonResponse {
  List<PokemonResult> _results;

  PokemonResponse({List<PokemonResult> results}) {
    this._results = results;
  }

  List<PokemonResult> get results => _results;
  set results(List<PokemonResult> results) => _results = results;

  PokemonResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _results = new List<PokemonResult>();
      json['results'].forEach((v) {
        _results.add(new PokemonResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonResult {
  String _name;
  String _url;

  PokemonResult({String name, String url}) {
    this._name = name;
    this._url = url;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get url => _url;
  set url(String url) => _url = url;

  PokemonResult.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['url'] = this._url;
    return data;
  }
}
