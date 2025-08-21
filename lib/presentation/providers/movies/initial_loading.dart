import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_loading.g.dart';

@riverpod
bool initialLoading (Ref ref) {

    final step1=ref.watch(moviesTmdbProviderProvider).isEmpty;
    final step2=ref.watch(moviesTmdbPopularityProvider).isEmpty;
    final step3=ref.watch(moviesTmdbUpcomingProvider).isEmpty;
    final step4=ref.watch(moviesTmdbTopRatedProvider).isEmpty;

    if(
      step1 || step2 || step3 || step4 
    ){
      return true;
    }


  return false;
}