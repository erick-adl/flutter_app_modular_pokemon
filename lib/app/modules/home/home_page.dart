import 'package:app_modular/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = Modular.get<HomeController>();
  final ILocalStorage storage = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Modular"),
      ),
      body: Observer(builder: (_) {
        if (_homeController.listPokemons.error != null) {
          return Center(
            child: Text("Error"),
          );
        }
        if (_homeController.listPokemons.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var list = _homeController.listPokemons.value;

        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index].name),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            _homeController.fetchPokemon();
          }),
    );
  }
}
