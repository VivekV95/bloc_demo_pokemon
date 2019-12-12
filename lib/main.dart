import 'package:flutter/material.dart';
import 'package:pokemon_bloc_demo/page/pokemon_detail.dart';
import 'package:pokemon_bloc_demo/page/pokemon_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => PokemonList(),
        '/detail': (context) => PokemonDetail(),
      },
    );
  }
}
