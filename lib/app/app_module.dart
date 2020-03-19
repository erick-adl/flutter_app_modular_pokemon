import 'package:app_modular/app/app_controller.dart';
import 'package:app_modular/app/app_widget.dart';
import 'package:app_modular/app/pages/home/home_controller.dart';
import 'package:app_modular/app/pages/home/home_page.dart';
import 'package:app_modular/app/pages/login/login_page.dart';
import 'package:app_modular/app/shared/repositories/poke_repository.dart';
import 'package:app_modular/app/shared/utils/constanties.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/login', child: (_, args) => LoginPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
