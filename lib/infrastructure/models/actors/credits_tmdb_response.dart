import 'package:cinemapedia_app/infrastructure/models/actors/credits_tmdb.dart';
class CreditsTmdbResponse {
    final int id;
    final List<CreditsTmdb> cast;
    final List<CreditsTmdb> crew;

    CreditsTmdbResponse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    factory CreditsTmdbResponse.fromJson(Map<String, dynamic> json) => CreditsTmdbResponse(
        id: json["id"],
        cast: List<CreditsTmdb>.from(json["cast"].map((x) => CreditsTmdb.fromJson(x))),
        crew: List<CreditsTmdb>.from(json["crew"].map((x) => CreditsTmdb.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
    };
}