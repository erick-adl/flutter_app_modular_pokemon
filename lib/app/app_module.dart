import 'package:app_modular/app/app_controller.dart';
import 'package:app_modular/app/app_widget.dart';
import 'package:app_modular/app/modules/home/home_module.dart';

import 'package:app_modular/app/shared/utils/constanties.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
