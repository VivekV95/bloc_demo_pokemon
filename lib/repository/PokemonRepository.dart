import 'dart:io';

import 'package:pokemon_bloc_demo/model/Pokemon.dart';
import 'package:pokemon_bloc_demo/network/PokemonAPI.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemon();
  Future<Pokemon> getPokemonDetail();
}

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonAPI pokemonAPI = PokemonAPI();

  @override
  Future<List<Pokemon>> getPokemon() async {
    var data = pokemonAPI.getPokemon();
    return data;
  }

  @override
  Future<Pokemon> getPokemonDetail() async {
    sleep(Duration(seconds: 5));
  }
}
