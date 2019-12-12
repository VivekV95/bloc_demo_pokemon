import 'package:flutter/material.dart';
import 'package:pokemon_bloc_demo/model/Pokemon.dart';
import 'package:pokemon_bloc_demo/network/PokemonAPI.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 1.0), child: buildLoading()),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => PokemonItem(
//                  pokemonName: pokemonList[index].name,
//                  imageUrl: pokemonList[index].imageUrl,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildLoading() {
  return Center(
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    ),
  );
}

class PokemonItem extends StatelessWidget {
  final String pokemonName;
  final String imageUrl;

  PokemonItem({this.pokemonName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset('images/gin.png'),
            flex: 5,
          ),
          Expanded(
            child: Text('AAA'),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
