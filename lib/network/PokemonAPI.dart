import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_bloc_demo/model/Pokemon.dart';
import 'package:pokemon_bloc_demo/model/PokemonResponse.dart';

class PokemonAPI {
  static const String _BASE_URL = 'https://pokeapi.co/api/v2/pokemon';
  static const int NETWORK_TIMEOUT = 10000;
  Dio _dio;

  PokemonAPI() {
    _dio = Dio();
  }

  Future<List<Pokemon>> getPokemon() async {
    List<Pokemon> pokemonList = List();
    var allPokemonData = await getNetworkData(_BASE_URL);
    PokemonResponse pokemonResponse = PokemonResponse.fromJson(allPokemonData);
    pokemonResponse.results.forEach((pokemonResult) async {
      var singlePokemonData = await getNetworkData(pokemonResult.url);
      pokemonList.add(Pokemon.fromJson(singlePokemonData));
    });
    var i = 0;
    return pokemonList;
  }

  Future getNetworkData(String url) async {
    Response response = await _dio.get(url);
    if (response.statusCode != 200) {
      throw NetworkError(message: 'Something went wrong');
    }
    return response.data;
  }
}

class NetworkError implements Exception {
  String message;
  NetworkError({this.message});
}
