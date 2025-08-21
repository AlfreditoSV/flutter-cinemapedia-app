import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String apiKeyTMDB=dotenv.env['API_KEY_TMDB']??'No se encontro API_KEY_TMDB';
}