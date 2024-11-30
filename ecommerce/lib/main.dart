import 'package:ecommerce/modules/presentations/modules/product/views/product.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/configs/app_theme.dart';
import 'modules/injection_container.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/services/get.dart';
import 'modules/presentations/modules/splash_screen/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  final box = await Get.box.init();
  await dotenv.load(fileName: '.env');

  runApp(ProviderScope(overrides: [
    storageServiceProvider.overrideWith((ref) => box),
  ], child: Core()));
}

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        ensureScreenSize: true,
        designSize: Size(360, 640),
        child: PlatformProvider(
          key: Get.key(platform),
          settings: PlatformSettingsData(
              iosUsesMaterialWidgets: true,
              matchMaterialCaseForPlatformText: false,
              legacyIosUsesMaterialWidgets: true,
              iosUseZeroPaddingForAppbarPlatformIcon: true,
              platformStyle: PlatformStyleData()),
          builder: (context) => PlatformTheme(
              themeMode: ThemeMode.light,
              materialLightTheme: AppThemes.lightTheme,
              materialDarkTheme: AppThemes.darkTheme,
              cupertinoDarkTheme: AppThemes.iosdarkTheme,
              cupertinoLightTheme: AppThemes.ioslightTheme,
              builder: (context) => PlatformApp(
                  debugShowCheckedModeBanner: false,
                  navigatorKey: navigatorKey,
                  scrollBehavior: Get.scrollBehaviour,
                  localizationsDelegates: const <LocalizationsDelegate<
                      dynamic>>[
                    DefaultMaterialLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate,
                    DefaultWidgetsLocalizations.delegate
                  ],
                  home: const ProductDetail())),
        ));
  }
}
