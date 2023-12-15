import 'package:go_router/go_router.dart';
import 'package:radio_qth_map/screen/add_operation_screen.dart';
import 'package:radio_qth_map/screen/introduce_screen.dart';
import 'package:radio_qth_map/screen/map_screen.dart';
import 'package:radio_qth_map/screen/terms_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroduceScreen(),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => MapScreen(
        initialCallsign: state.uri.queryParameters['callsign'],
      ),
    ),
    GoRoute(
      path: '/map/:id',
      builder: (context, state) => MapScreen(
        operationId: state.pathParameters['id'],
      ),
    ),
    GoRoute(
      path: '/qso/add',
      builder: (context, state) => const AddOperationScreen(),
    ),
    GoRoute(
      path: '/terms',
      builder: (context, state) => const TermsScreen(),
    )
  ],
);
