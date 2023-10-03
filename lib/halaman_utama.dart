import 'package:flutter/material.dart';
import 'package:kuis/pokemon_data.dart';

import 'halaman_detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Pokedex",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.redAccent,
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: listPokemon.length,
          itemBuilder: (context, index) {
            final PokemonData pokemon = listPokemon[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HalamanDetail(pokemon: pokemon);
                }));
              },
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Image.network(pokemon.image),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(pokemon.name)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
