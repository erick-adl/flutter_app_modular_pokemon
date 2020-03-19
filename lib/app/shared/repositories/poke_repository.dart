import 'package:app_modular/app/shared/models/poke_model.dart';
import 'package:dio/dio.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokeModel>> fetchPokemons() async {
    var response = await dio.get('pokemon');
    var list = response.data['results'] as List;
    var pokomons =
        list.map((json) => new PokeModel(json['name'].toString())).toList();
    return pokomons;
  }
}
