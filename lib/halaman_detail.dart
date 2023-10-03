import 'package:flutter/material.dart';
import 'package:kuis/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key, required this.pokemon});
  final PokemonData pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite), color: Colors.white,),
        ],
        title: Center(
            child: Text(
          pokemon.name,
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Image.network(pokemon.image),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    "Type",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(pokemon.type[0]),
                  SizedBox(height: 10),
                  Text(
                    "Weaknees",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(pokemon.weakness[0]),
                  SizedBox(height: 10,),
                  Text(
                    "Previous Evolution",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(pokemon.prevEvolution[0]),
                  SizedBox(height: 10,),
                  Text(
                    "Next Evolution",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(pokemon.nextEvolution[0])
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IconButton(
            onPressed: () {
              _launcher(pokemon.wikiUrl);
            },
            icon: Icon(Icons.search_rounded),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }

  Future<void> _launcher(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception("gagal membuka url : $_url");
    }
  }
}
