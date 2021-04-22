import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/test5/draggable.dart';
import 'package:flutter_app/test5/popup_dialog.dart';
import 'package:flutter_app/test5/second_page.dart';
import 'package:flutter_app/test5/tab_bar.dart';
import 'package:flutter_app/utils/toast_util.dart';
import 'package:flutter_app/utils/will_pop_scope.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => CurrentLocale())],
    child: MyApp(),
  ));
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

///************
///MaterialApp按照如下的规则匹配路由：
///
/// 路由为/，home不为null则使用home。
/// 使用routes指定的路由。
/// 使用onGenerateRoute生成的路由，处理除home和routes以外的路由。
/// 如果上面都不匹配则调用onUnknownRoute。
///
///
///***********************///
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyRouteObserver<PageRoute> myRouteObserver = MyRouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentLocale>(builder: (context, currentLocale, child) {
      return MaterialApp(
        onGenerateTitle: (context) {
          return S.of(context).home_title;
        },
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //语言国际化
        supportedLocales: S.delegate.supportedLocales,
        //默认中文
        // localeResolutionCallback:
        //     (Locale locale, Iterable<Locale> supportedLocales) {
        //   var result = supportedLocales
        //       .where((element) => element.languageCode == locale.languageCode);
        //   if (result.isNotEmpty) {
        //     return locale;
        //   }
        //   return Locale('zh');
        // },
        locale: currentLocale.value,

        theme: ThemeData(primarySwatch: Colors.blue),
        darkTheme: ThemeData(primaryColor: Colors.red),
        themeMode: ThemeMode.system,
        routes: <String, WidgetBuilder>{
          OnePage.ROUTES: (context) => OnePage(),
          SecondPage.ROUTES: (context) => SecondPage(S.of(context).page_b),
          ThreePage.ROUTES: (context) => ThreePage(S.of(context).page_c),
          FourPage.ROUTES: (context) => FourPage(S.of(context).page_d),
        },
        initialRoute: OnePage.ROUTES,
        navigatorObservers: [myRouteObserver],
        home: OnePage(),
      );
    });
  }
}

class OnePage extends StatelessWidget {
  static const String ROUTES = "OnePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).page_a), centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('A 页面(pushNamed)'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(SecondPage.ROUTES, arguments: "来自A的数据")
                    .then((value) => print(value));
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('A 页面(PageRoute)'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) {
                          return SecondPage(S.of(context).page_b);
                        },
                        settings: RouteSettings(
                            name: SecondPage.ROUTES, arguments: "来自A的数据")))
                    .then((value) => print(value));
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('切换中文'),
              onPressed: () {
                Provider.of<CurrentLocale>(context, listen: false)
                    .setLocale(const Locale('zh'));
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('切换英文'),
              onPressed: () {
                Provider.of<CurrentLocale>(context, listen: false)
                    .setLocale(const Locale('en'));
              },
            )
          ],
        ));
  }
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class SecondPage extends StatelessWidget {
  static const String ROUTES = "SecondPage";

  final String title;

  const SecondPage(this.title);

  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context).settings.arguments;
    print(msg);
    return Scaffold(
        appBar: AppBar(title: Text(title), centerTitle: true),
        body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text(title),
            onPressed: () {
              //销毁自己，再跳转到其他页面
              // Navigator.of(context).popAndPushNamed(ThreePage.ROUTES,result: "从B返回的数据");
              // Navigator.of(context).pushReplacementNamed(ThreePage.ROUTES);

              Navigator.of(context).pushNamed(ThreePage.ROUTES);
            },
          ),
        ));
  }
}

class ThreePage extends StatelessWidget {
  static const String ROUTES = "ThreePage";

  final String title;

  const ThreePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title), centerTitle: true),
        body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text(title),
            onPressed: () {
              //清空两者之间的页面
              Navigator.of(context).pushNamedAndRemoveUntil(
                  FourPage.ROUTES, ModalRoute.withName(SecondPage.ROUTES));
              //清空栈顶页面
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     FourPage.ROUTES, (Route route) => false);
            },
          ),
        ));
  }
}

class FourPage extends StatelessWidget {
  static const String ROUTES = "FourPage";

  final String title;

  const FourPage(this.title);

  @override
  Widget build(BuildContext context) {
    return WillPopScopeTestRoute(
        child: Scaffold(
            appBar: AppBar(title: Text(title), centerTitle: true),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(title),
                  onPressed: () {
                    Navigator.of(context)
                        .maybePop(S.current.return_data_form_d);
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: Text("返回到A页面"),
                  onPressed: () {
                    //返回到A页面
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName(OnePage.ROUTES));
                    print(S.of(context).count(100));
                  },
                ),
              ],
            )));
  }
}

class CurrentLocale with ChangeNotifier {
  Locale _locale = ui.window.locale;

  Locale get value => _locale;

  void setLocale(locale) {
    _locale = locale;
    notifyListeners();
  }
}

///----------------路由栈监听-----------------------///
class MyRouteObserver<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print('didPush route: $route,previousRoute:$previousRoute \n');
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print('didPop route: $route,previousRoute:$previousRoute \n');
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print('didReplace newRoute: $newRoute,oldRoute:$oldRoute \n');
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
    print('didRemove route: $route,previousRoute:$previousRoute \n');
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    print('didStartUserGesture route: $route,previousRoute:$previousRoute \n');
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    print('didStopUserGesture \n');
  }
}
