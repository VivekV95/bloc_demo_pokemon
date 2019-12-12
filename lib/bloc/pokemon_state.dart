import 'package:equatable/equatable.dart';
import 'package:pokemon_bloc_demo/model/Pokemon.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonInitial extends PokemonState {
  const PokemonInitial();

  @override
  List<Object> get props => [];
}

class PokemonLoading extends PokemonState {
  const PokemonLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PokemonData extends PokemonState {
  final List<Pokemon> pokemonList;
  const PokemonData(this.pokemonList);

  @override
  // TODO: implement props
  List<Object> get props => [pokemonList];
}

class PokemonError extends PokemonState {
  final String message;
  const PokemonError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
