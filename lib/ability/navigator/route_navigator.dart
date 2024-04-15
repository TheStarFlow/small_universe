//     @Description
//     @Author zhongzusheng
//     @date 2024_04_11

import 'package:flutter/material.dart';
import 'package:small_universe/ability/navigator/navigator.dart';
import 'package:small_universe/home/home_page.dart';
import 'package:small_universe/login/auth_code_page.dart';
import 'package:small_universe/login/phone_number_page.dart';
import 'package:small_universe/welcome/welcom_page.dart';

enum RouteStatus {
  welcome,
  loginTypePhoneNum,
  loginTypeAuthCode,
  home,
  unKnow,
}

class SmallUniverseRouteDelegate extends RouterDelegate<SmallUniverseRoutePath>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<SmallUniverseRoutePath> {
  SmallUniverseRoutePath? path;

  List<MaterialPage> pages = [];

  //当前页面
  RouteStatus _routeStatus = RouteStatus.home;

  RouteStatus get routeStatus => _routeStatus;

  Map? _args;

  SmallUniverseRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    MyNavigator.getInstance().registerJump(RouteJumpListener(
        onJumpTo: (RouteStatus routeStatus, {Map? args}) {
      _routeStatus = routeStatus;
      _args = args;
      notifyListeners();
    } as OnJumpTo));
  }

  @override
  Widget build(BuildContext context) {
    _managerStack();
    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, results) {
        if (!route.didPop(results)) {
          return false;
        }
        return true;
      },
    );
  }

  //自己维护栈区堆栈
  _managerStack() {
    //获取在栈区中的位置
    var index = getPageIndex(pages, routeStatus);

    //截取栈区
    List<MaterialPage> tempPages = pages;

    if (index != -1) {
      tempPages = tempPages.sublist(0, index);
    }
    var page = getPage(routeStatus);

    tempPages = [...tempPages, page];

    pages = tempPages;
  }

  MaterialPage getPage(RouteStatus status) {
    var page;
    if (status == RouteStatus.home) {
      pages.clear();
      page = pageWrap(const HomePage());
    } else if (status == RouteStatus.welcome) {
      page = pageWrap(const WelcomePage());
    } else if (status == RouteStatus.loginTypeAuthCode) {
      page = pageWrap(const AuthCodePage());
    } else if (status == RouteStatus.loginTypePhoneNum) {
      page = pageWrap(const PhoneNumberPage());
    }
    return page;
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey;

  @override
  Future<void> setNewRoutePath(SmallUniverseRoutePath configuration) async {
    path = configuration;
  }

  ///获取routeStatus在页面栈中的位置
  int getPageIndex(List<MaterialPage> pages, RouteStatus routeStatus) {
    for (int i = 0; i < pages.length; i++) {
      MaterialPage page = pages[i];
      if (getStatus(page) == routeStatus) {
        return i;
      }
    }
    return -1;
  }
}

MaterialPage pageWrap(Widget child) {
  return MaterialPage(key: ValueKey(child.hashCode), child: child);
}

class SmallUniverseRoutePath {
  final String location;

  SmallUniverseRoutePath.home() : location = "/";

  SmallUniverseRoutePath.detail() : location = "/detail";
}

RouteStatus getStatus(MaterialPage page) {
  var child = page.child;
  if (child is WelcomePage) {
    return RouteStatus.welcome;
  } else if (child is AuthCodePage) {
    return RouteStatus.loginTypeAuthCode;
  } else if (child is PhoneNumberPage) {
    return RouteStatus.loginTypePhoneNum;
  } else if (child is HomePage) {
    return RouteStatus.home;
  }
  return RouteStatus.unKnow;
}
