import 'package:flutter/material.dart';
import 'package:flutter_app/login_screen.dart';
//import 'package:flutter_widgets/canvas/painting.dart';
//import 'package:flutter_widgets/codefile.dart';
import 'load_image.dart';
//import 'package:flutter_widgets/login/login_page.dart';
import 'home.dart';
import 'load_pdf.dart';
//import 'package:flutter_widgets/plugins/db/shared.dart';
//import 'package:flutter_widgets/plugins/firetop/change_notifier.dart';
import 'screen_args.dart';
//import 'package:flutter_widgets/themes/db/theme_prefs.dart';
//import 'package:flutter_widgets/themes/db/themes_db.dart';
//import 'package:flutter_widgets/themes/db/themes_notifier_db.dart';
//import 'package:flutter_widgets/themes/sharedPrefs/themes_notifier_sp.dart';
//import 'package:flutter_widgets/themes/sharedPrefs/themes_sharedPrefs.dart';
//import 'package:flutter_widgets/themes/themes_demo.dart';
//import 'package:flutter_widgets/themes/themes_notifier.dart';
//import 'package:flutter_widgets/tts/tts_sample.dart';
import 'package:provider/provider.dart';

import 'homeSlider.dart';
//import 'images/upload_image.dart';
//import 'lists/list_images.dart';
//import 'login/firebase_login.dart';
//import 'login/user_profile.dart';
//import 'menus/sf_popupmenubutton.dart';
//import 'menus/sl_popupmenubutton.dart';
//import 'menus/webview.dart';
//import 'navigation/page_list_1.dart';
//import 'patterns/bloc_pattern.dart';
//import 'persistence/ecom.dart';
//import 'plugins/firetop/fire_auth_service.dart';
//import 'quizzie/quizze_demo.dart';
//import 'sliders/slider_demo.dart';
//import 'swtch/switch_list_tile1.dart';
//import 'unknown.dart';

const String HOME = "/";
const String POP_UP_MENU_BUTTON_SL = '/popupMenuButton_sl';
const String POP_UP_MENU_BUTTON_SF = '/popupMenuButton_sf';
const String LIST_IMAGES = '/LIST_IMAGES';
const String WEBVIEW = '/webview';
const String SWITCH_LISTTILE_1 = 'SWITCH_LISTTILE_1';
const String FIREBASE_LOGIN = 'FIREBASE_LOGIN';
const String USER_PROFILE = 'USER_PROFILE';
const String LOGIN_PAGE = 'LOGIN_PAGE';
const String THEMES_DEMO = 'THEMES_DEMO';
const String THEMES_DEMO_DB = 'THEMES_DEMO_DB';
const String THEMES_DEMO_SHAREDPREFS = 'THEMES_DEMO_SHAREDPREFS';
const String SLIDER_DEMO = 'SLIDER_DEMO';
const String LOAD_IMAGE_FIR_STORAGE = 'LOAD_IMAGE_FIR_STORAGE';
const String UPLOAD_IMAGE_FIR_STORAGE = 'UPLOAD_IMAGE_FIR_STORAGE';
const String TTS_PLUGIN = 'TTS_PLUGIN';
const String COLOR_FILTER_DEMO = 'COLOR_FILTER_DEMO';
const String LOAD_PDF_FIR_STORAGE = 'LOAD_PDF_FIR_STORAGE';
const String SHOW_CODE_FILE = 'SHOW_CODE_FILE';
const String CANVAS_PAINTING = 'CANVAS_PAINTING';
const String LOCAL_DB = 'LOCAL_DB';
const String NAV_APP = 'NAV_APP';
const String BLOC_PATTERN = 'BLOC_PATTERN';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case LOAD_IMAGE_FIR_STORAGE:
      return MaterialPageRoute(builder: (context) => LoadFirbaseStorageImage());
      break;

  /*   case BLOC_PATTERN:
      return MaterialPageRoute(builder: (context) => MyAppBlocPattern());
      break;

    case NAV_APP:
      return MaterialPageRoute(builder: (context) => PageListing());
      break;

    case LOCAL_DB:
      return MaterialPageRoute(builder: (context) => ProductListing());
      break;

    case CANVAS_PAINTING:
      return MaterialPageRoute(builder: (context) => CanvasPainting());
      break;

    case SHOW_CODE_FILE:
      final ScreenArguments screenArgs = routeSettings.arguments;

      return MaterialPageRoute(
          builder: (context) => CodeFileWidget(
            pageName: screenArgs.pageName,
            recipeName: screenArgs.recipeName,
            codeFilePath: screenArgs.codeFilePath,
            codeGithubPath: screenArgs.codeGithubPath,
          ));
      break;
*/
    case LOAD_PDF_FIR_STORAGE:
      final ScreenArguments screenArgs = routeSettings.arguments;
      return MaterialPageRoute(
          builder: (context) => LoadFirbaseStoragePdf(
            pageName: screenArgs.pageName,
            recipeName: screenArgs.recipeName,
            codeFilePath: screenArgs.codeFilePath,
            codeGithubPath: screenArgs.codeGithubPath,
          ));
      break;


  }
}
