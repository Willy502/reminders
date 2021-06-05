import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences _instance = new UserPreferences._(); // Singleton

  // Retorna una instancia existente sin tener que crear una nueva si existiera
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  SharedPreferences? _preferences;

  initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Getters y Setters
  set genero(int value) {
    _preferences?.setInt('genero', value);
  }

  int get genero {
    return _preferences?.getInt('genero') ?? 1; // ?? si es null
  }

  set colorSecundario(bool value) {
    _preferences?.setBool('colorSecundario', value);
  }

  bool get colorSecundario {
    return _preferences?.getBool('colorSecundario') ?? false; // ?? si es null
  }

}