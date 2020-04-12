import 'package:bloc/bloc.dart';
import 'package:sidebaranimationflutter/pages/myaccountspage.dart';
import 'package:sidebaranimationflutter/pages/myorderspage.dart';
import 'package:sidebaranimationflutter/Map/map.dart';

enum NavigationEvents {
  MapClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.MapClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
    }
  }
}