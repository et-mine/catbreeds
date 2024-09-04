import 'package:app_pragma_catbreeds/blocs/blocs.dart';
import 'package:app_pragma_catbreeds/presentation/screens/home/HomeCats.dart';
import 'package:app_pragma_catbreeds/presentation/splash_screen.dart';
import 'package:app_pragma_catbreeds/utils/util_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCatBreeds extends StatelessWidget {
  const AppCatBreeds({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<CatsBloc>(create: (_) => CatsBloc())],
        child: MaterialApp(
          title: 'CatBreeds',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: UtilColors.colorPrincipal,
              appBarTheme: const AppBarTheme(
                  elevation: 0, backgroundColor: UtilColors.colorSecundario)),
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (_) => const SplashScreen(),
            HomeCats.routeName: (_) => const HomeCats()
          },
        ));
  }
}
