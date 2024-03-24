import 'package:auto_injector/auto_injector.dart';

abstract class DependencyInjector {
  dynamic get instance;

  ///Buscar dependência injetada
  I get<I>();

  ///Buscar dependência injetada ou retorna nulo
  I? tryGet<I>();

  ///Adicionar dependencia pelo metodo **.new**
  void add<I>(Function instace);

  ///Adicionar dependencia instaciada. EXEMP: Database();
  void addInstance<I>(I instace);

  ///Adicionar dependencia pelo metodo **.new**
  void addLazySingleton<I>(Function instace);

  ///Adicionar dependencia pelo metodo **.new**
  void addSingleton<I>(Function instace);

  ///Remove dependencia pela  inteface.
  void disposeSingleton<I>();

  ///Finaliza as injeções.
  void finish();
}

class DependencyInjectorImpl extends DependencyInjector {
  static final _injector = AutoInjector();

  @override
  DependencyInjectorImpl get instance => this;

  @override
  void add<I>(Function instace) {
    _injector.add<I>(instace);
  }

  @override
  void addInstance<I>(I instace) {
    _injector.addInstance<I>(instace);
  }

  @override
  void addLazySingleton<I>(Function instace) {
    _injector.addLazySingleton<I>(instace);
  }

  @override
  void addSingleton<I>(Function instace) {
    _injector.addSingleton<I>(instace);
  }

  @override
  void finish() {
    _injector.commit();
  }

  @override
  I get<I>() {
    return _injector.get<I>();
  }

  @override
  I? tryGet<I>() {
    return _injector.tryGet<I>();
  }

  @override
  void disposeSingleton<I>() {
    _injector.disposeSingleton<I>();
  }
}
