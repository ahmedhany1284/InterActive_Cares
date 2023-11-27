import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_care/constants.dart';
import 'package:interactive_care/core/utils/app_router.dart';
import 'package:interactive_care/features/login/presentation/view_model/cubit/cubit.dart';
import 'package:interactive_care/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isUserLoggedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  logged = isUserLoggedIn();
  print('loogedd  -->  $logged');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'InterActive Care',
        theme: ThemeData.light(useMaterial3: false).copyWith(
          scaffoldBackgroundColor: kprimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
        ),
      ),
    );
  }
}
