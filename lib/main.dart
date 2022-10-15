import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Admin/admin_screen.dart';
import 'package:untitled/home.dart';
import 'package:untitled/provider/user_provider.dart';
import 'package:untitled/router.dart';
import 'package:untitled/screen/auth_screen.dart';
import 'package:untitled/service/auth_service.dart';
import 'package:untitled/widget/bottom_bar.dart';

import 'constant/global_variable.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      )
    ],
    child: App(),
  ));
  //())
  //],child:AuthScreen())
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthService authService = AuthService();
  // This widget is the root of your application.
  @override
  void initState() {
    //authService.getUserData(context);
    authService.getUserData(context);
    // TODO: implement initState
    super.initState();
    //  authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<UserProvider>(context).user.token!=null?Provider.of<UserProvider>(context).user.token:'okkk');
    return MaterialApp(
        title: 'Amazon Clone',
        theme: ThemeData(
          primaryColor: Global.secondaryColor,
          colorScheme: ColorScheme.light(),
          appBarTheme: AppBarTheme(
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black)),
          scaffoldBackgroundColor: Global.backgroundColor,
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (setting) => generateRoute(setting),
        home:
            //Scaffold(
            //    body:
            Provider.of<UserProvider>(context).user.token.isNotEmpty
                ? Provider.of<UserProvider>(context).user.type == 'admin'
                    ? AdminScreen()
                    : BottomBar()
                // AuthScreen()
                //   : Center(child: CircularProgressIndicator())            //Home()
                : AuthScreen()
        // MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>
        //     UserProvider())],child: AuthScreen(),)
        //  AuthScreen()

//         Center(child: Builder(builder: (context){
// return ElevatedButton(onPressed: (){
//           Navigator.pushNamed(context, AuthScreen.routeName);
//         }, child:Text('click here'));

//         }),),
        //  )
        );
  }
}
