import 'package:cinemapedia_app/config/theme/app_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_notifier.g.dart';

@Riverpod(keepAlive: true)
class AppThemeNotifier extends _$AppThemeNotifier {
  @override
  AppTheme  build() {
    return AppTheme();
  }


  void toogleIsDarkMode(){
    final bool isDarkMode =state.isDarkMode;
    state=state.copiWith(isDarkMode: !isDarkMode);
  }

}