import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/landing/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_ui/firebase_options.dart';
import 'package:whatsapp_ui/router.dart';
import 'package:whatsapp_ui/screens/mobile_screen.dart';
import 'package:whatsapp_ui/widgets/colours.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          onGenerateRoute: generaterouter,
          //  (settings) {
          //   generaterouter(settings);
          //   return null;
          // },
          title: 'Whatsapp UI',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            // dialogBackgroundColor: backgroundColor,
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(color: appBarColor),
          ),
          home: ref.watch(userDataAuthprovider).when(
              data: data,
              error: (error, stackTrace) {
                return ErrorScreen(
                    error: 'somthing went wrong in data ${error.toString()}');
              },
              loading: () => const Loader()),
          // const ResponsiveLayout(
          //   mobileScreenLayout: MobileScreen(),
          //   webScreenLayout: WebScreen(),
          // ),
        );
      },
    );
  }
}

Widget data(user) {
  if (user == null) {
    return const LandingScreen();
  }
  return const MobileScreen();
}
