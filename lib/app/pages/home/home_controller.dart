import 'package:app_modular/app/shared/models/poke_model.dart';
import 'package:app_modular/app/shared/repositories/poke_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokeModel>> listPokemons;

  _HomeControllerBase(this.repository) {
    fetchPokemon();
  }

  @action
  fetchPokemon() {
    listPokemons = repository.fetchPokemons().asObservable();
  }
}
