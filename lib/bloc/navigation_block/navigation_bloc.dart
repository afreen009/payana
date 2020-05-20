import 'package:sidebaranimationflutter/Map/map2.dart';
import 'package:sidebaranimationflutter/license/verification.dart';
import 'package:sidebaranimationflutter/pages/myaccountspage.dart';
import 'package:sidebaranimationflutter/Map/map.dart';
import 'package:sidebaranimationflutter/pages/payment.dart';
import 'package:sidebaranimationflutter/pages/promo.dart';
import 'package:sidebaranimationflutter/pages/ride_history.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  HomeEvent,
  RideHistoryEvent,
  MapClickedEvent,
  PaymentEvent,
  VerificationEvent,
  PromoCode,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MapPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeEvent:
        yield MapPage();
        break;
      case NavigationEvents.RideHistoryEvent:
        yield RideHistory();
        break;
      case NavigationEvents.MapClickedEvent:
        yield MapPage();
        break;
      case NavigationEvents.PaymentEvent:
        yield Payment();
        break;
      case NavigationEvents.VerificationEvent:
        yield verrification();
        break;
      case NavigationEvents.PromoCode:
        yield PromoFragment1();
        break;
    }
  }
}