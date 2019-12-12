import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class GetPokemonEvent extends PokemonEvent {
  const GetPokemonEvent();

  @override
  List<Object> get props => null;
}

class GetPokemonDetail extends PokemonEvent {
  final String pokemonNameOrId;

  const GetPokemonDetail(this.pokemonNameOrId);

  @override
  // TODO: implement props
  List<Object> get props => [pokemonNameOrId];
}
