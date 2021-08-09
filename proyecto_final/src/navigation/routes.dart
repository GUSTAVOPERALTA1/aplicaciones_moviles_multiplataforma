import 'package:proyecto_final/src/pages/splash_screen.dart';

class Routes{
  static const splash ='/';
  static const intro ='/intro';
  static const home ='/home';
  static const createAccount ='/createAccount';
  static const signInEmail ='/signInEmail';
  static const insertNew = '/insertNew';

  static Route routes(RouteSettings routeSettings){
    switch(routeSettings.name){
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case home:
        return _buildRoute(HomeScreen.create);
      case createAccount:
        return _buildRoute(EmailCreate.create);
      case insertNew:
        return _buildRoute(InsertNew.create);
      case signInEmail:
        return _buildRoute(EmailSignIn.create);
        default:
        throw Exception('No existe la ruta');



    }
  }
  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}