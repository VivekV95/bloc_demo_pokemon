import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc_demo/bloc/bloc.dart';
import 'package:pokemon_bloc_demo/model/Pokemon.dart';
import 'package:pokemon_bloc_demo/network/PokemonAPI.dart';

class PokemonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    performGetPokemonEvent(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 1.0),
          child: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state is PokemonLoading) {
                return buildLoading();
              }
              return Container(
                width: 0,
                height: 0,
              );
            },
          ),
        ),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonInitial)
            return Center(
              child: Text('Initial'),
            );
          else if (state is PokemonData) {
            return buildGridView(pokemonList: state.pokemonList);
          } else
            return Center(
              child: Text('Initial'),
            );
        },
      ),
    );
  }
}

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  PokemonItem({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(pokemon.sprites.frontDefault),
            flex: 5,
          ),
          Expanded(
            child: Text(pokemon.name),
            flex: 2,
          ),
        ],
      ),
    );
  }
}

Widget buildLoading() => Center(
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );

Widget buildGridView({List<Pokemon> pokemonList}) => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => PokemonItem(
        pokemon: pokemonList[index],
      ),
      itemCount: pokemonList.length,
    );

void performGetPokemonEvent(BuildContext context) {
  // ignore: close_sinks
  final pokemonBloc = BlocProvider.of<PokemonBloc>(context);
  pokemonBloc.add(GetPokemonEvent());
}
