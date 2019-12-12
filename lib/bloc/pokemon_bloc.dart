import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pokemon_bloc_demo/network/PokemonAPI.dart';
import 'package:pokemon_bloc_demo/repository/PokemonRepository.dart';
import './bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;

  PokemonBloc(this.pokemonRepository);
  @override
  PokemonState get initialState => PokemonInitial();

  @override
  Stream<PokemonState> mapEventToState(
    PokemonEvent event,
  ) async* {
    yield PokemonLoading();
    if (event is GetPokemonEvent) {
      try {
        final pokemonList = await pokemonRepository.getPokemon();
        yield PokemonData(pokemonList);
      } on NetworkError {
        yield PokemonError('Something went wrong');
      }
    }
  }
}
