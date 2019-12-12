import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc_demo/bloc/bloc.dart';
import 'package:pokemon_bloc_demo/page/pokemon_detail.dart';
import 'package:pokemon_bloc_demo/page/pokemon_list.dart';
import 'package:pokemon_bloc_demo/repository/PokemonRepository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              builder: (context) => PokemonBloc(PokemonRepositoryImpl()),
              child: PokemonListPage(),
            ),
        '/detail': (context) => PokemonDetail(),
      },
    );
  }
}
