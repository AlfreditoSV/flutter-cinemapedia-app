import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final isDarkMode = ref.watch(appThemeNotifierProvider);

    final styleTitle=Theme.of(context).textTheme.titleMedium;
    final colors=Theme.of(context).colorScheme;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.movie_outlined,color: colors.secondary,),
            Text('Cinemapedia',style: styleTitle,),
            const Spacer(),
            IconButton(  onPressed: () {
              ref.watch(appThemeNotifierProvider.notifier).toogleIsDarkMode();
            },
            icon: Icon(isDarkMode.isDarkMode ? Icons.dark_mode : Icons.sunny),),
            IconButton(icon: Icon(Icons.search),onPressed: () {
              
              
            },)
          ],
        ),
      ),
    );
  }
}