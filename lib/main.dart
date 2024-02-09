import 'package:Ecommerce/core/utils/api_services.dart';
import 'package:Ecommerce/core/widgets/show_snack_bar.dart';
import 'package:Ecommerce/feature/Authentication/data/auth_bloc/auth_bloc.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/sign_in_view.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_cubit.dart';
import 'package:Ecommerce/feature/home/data/repos/home_repo_impl.dart';
import 'package:Ecommerce/feature/home/presentation/view_model/all_product_cubit/fetch_all_products_cubit.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view_model/cubit/image_cubit.dart';
import 'package:Ecommerce/feature/splash/splash_view.dart';
import 'package:Ecommerce/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchAllProductsCubit(HomeRepoImpl(ApiServices(Dio())))
                ..fetchAllProduct(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 181, 180, 180),
                ),
              );
            } else if (snapshot.hasError) {
              return showSnackBar(context, "Something went wrong");
            } else if (snapshot.hasData) {
              return const SplashView();
            } else {
              return const SignInView();
            }
          },
        ),
      ),
    );
  }
}
