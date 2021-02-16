import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioasys/api/api_client.dart';
import 'package:ioasys/app_redux/reducer.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/dashboard/dashboard.dart';
import 'package:ioasys/filter_redux/action.dart';
import 'package:ioasys/filter_redux/state.dart';
import 'package:ioasys/login_redux/state.dart';
import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/models/enterprise_info.dart';
import 'package:ioasys/models/enterprise_list.dart';
import 'package:ioasys/persistence/data_source.dart';
import 'package:ioasys/persistence/repository.dart';
import 'package:ioasys/search_redux/action.dart';
import 'package:ioasys/search_redux/middleware.dart';
import 'package:ioasys/search_redux/state.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:retrofit/dio.dart';

class MockConnChecker extends Mock implements DataConnectionChecker {}

class MockSearchApiClient extends Mock implements EnterpriseApiClient {}

class MockEnterpriseRepository extends Mock implements EnterprisesRepository {}

EnterpriseInfoList simulateApiCallResponse(String term) {
  final apiData = {
    'enterprises': [
      {
        "id": 55,
        "email_enterprise": null,
        "facebook": null,
        "twitter": null,
        "linkedin": null,
        "phone": null,
        "own_enterprise": false,
        "enterprise_name": "Invisible Artists",
        "photo": "/uploads/enterprise/photo/55/240.jpeg",
        "description":
            "We are brand, motion, design consultants driven to understand, challenge and create for our clients. We believe in the balance of creative and commercial outcomes to deliver campaigns & visual communications. \n\nChallenging ourselves and the brief to be better. This ensures that what we create is not only meeting objectives but is also a real work of art. \n\nSure, we’re Invisible Artists, but our work is far from inconspicuous. ",
        "city": "London",
        "country": "UK",
        "value": 0,
        "share_price": 5000.0,
        "enterprise_type": {"id": 13, "enterprise_type_name": "Social"}
      },
      {
        "id": 56,
        "email_enterprise": null,
        "facebook": null,
        "twitter": null,
        "linkedin": null,
        "phone": null,
        "own_enterprise": false,
        "enterprise_name": "Brown Betty Limited",
        "photo": "/uploads/enterprise/photo/56/240.jpeg",
        "description":
            "Brown Bettty is a PR & Influencer Marketing agency that specializes in UK & EU digital entertainment industry. The company is especially renowned for managing successful campaigns for mobile games, having worked with clients including SEGA, Miniclip and BBC Worldwide to name but a few. ",
        "city": "London",
        "country": "UK",
        "value": 0,
        "share_price": 5000.0,
        "enterprise_type": {"id": 15, "enterprise_type_name": "Games"}
      },
      {
        "id": 57,
        "email_enterprise": null,
        "facebook": null,
        "twitter": null,
        "linkedin": null,
        "phone": null,
        "own_enterprise": false,
        "enterprise_name": "GAGE International Ltd",
        "photo": "/uploads/enterprise/photo/57/240.jpeg",
        "description":
            "GAGE Analytics is a SaaS based global payroll reporting/analysis application that enables consolidation, storage, reporting and analysis of payroll data. It gives companies a deep insight into their payroll costs without changing its existing payroll system and its process infrastructure, massively saving costs and mitigating risks. Global payroll market is 16.7bn USD and growing. Big data and business analytics worldwide revenues will grow from nearly \$122B in 2015 to more than \$187B in 2019, an increase of more than 50% over the five-year forecast period (Forbes). Our vision is to become the biggest embedded HR/Payroll analytics application in the world.",
        "city": "London",
        "country": "UK",
        "value": 0,
        "share_price": 5000.0,
        "enterprise_type": {"id": 11, "enterprise_type_name": "Software"}
      }
    ]
  };

  return EnterpriseInfoList((b) => b
    ..enterprises = apiData['enterprises']
        .where((e) => (e['enterprise_name'] as String).contains(term))
        .map((e) => EnterpriseInfo.of(e))
        .toList());
}

void main() {
  Store<AppState> store;

  final checker = MockConnChecker();

  final enterpriseApi = MockSearchApiClient();

  final memory = InMemoryDataSource();

  final network = NetworkDataSource(enterpriseApi);

  final repository = EnterprisesRepository(memory, network);

  final uid = 'testeapple@ioasys.com.br';
  final client = '_9ZfTLHnffET-ndG2nEgfQ';
  final accessToken = '18gPK0VnvePx1hOfQRwxhQ';

  final credentials = AuthCredentials((b) => b
    ..accessToken = accessToken
    ..client = client
    ..uid = uid);

  setUp(() {
    store = Store<AppState>(reducer,
        initialState: AppState.copyWith(
            searchArg: SearchEmptyState(),
            filterArg: FilterEmptyState(),
            loginArg: LoginSuccessState(credentials)),
        middleware: [
          TypedMiddleware<AppState, SearchAction>(
              SearchMiddleware(repository, checker, duration: 0))
        ]);
  });

  testWidgets('Verify load initial state properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(StoreProvider(
      store: store,
      child: MaterialApp(
        home: DashBoardView(),
      ),
    ));

    expect(find.text('Procure empresas'), findsOneWidget);
  });

  testWidgets('Verify filter is selected and displayed properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(StoreProvider(
      store: store,
      child: MaterialApp(
        home: DashBoardView(),
      ),
    ));

    store.dispatch(SelectFilterAction(33, 'Software'));

    await tester.pump();

    expect(find.text('Software'), findsOneWidget);
    expect(store.state.filterState, isA<FilterSelectedState>());
  });

  testWidgets('Verify empt search is properly displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(StoreProvider(
      store: store,
      child: MaterialApp(
        home: DashBoardView(),
      ),
    ));

    store.dispatch(SearchAction(''));

    await tester.pump();

    expect(store.state.searchState, isA<SearchInitialSate>());
  });

  testWidgets('Verify search term is not found and properly displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(StoreProvider(
      store: store,
      child: MaterialApp(
        home: DashBoardView(),
      ),
    ));

    when(checker.hasConnection).thenAnswer((_) async => true);

    when(enterpriseApi.getEnterprisesWithName(
            name: '@', accessToken: accessToken, client: client, uid: uid))
        .thenAnswer((_) async => HttpResponse(
            EnterpriseInfoList((b) => b..enterprises = []),
            Response(statusCode: 200)));

    await tester.enterText(find.byType(TextField), '@');

    expect(find.text('Nenum resultado encontrado'), findsOneWidget);
    expect(store.state.searchState, isA<SearchEmptyState>());
  });

  testWidgets('Verify internet connection error is properly handled',
      (WidgetTester tester) async {
    await tester.pumpWidget(StoreProvider(
      store: store,
      child: MaterialApp(
        home: DashBoardView(),
      ),
    ));

    when(checker.hasConnection).thenAnswer((_) async => false);

    await tester.enterText(find.byType(TextField), '@');

    expect(store.state.searchState, isA<SearchErrorState>());
  });

  testWidgets('Verify generic search is properly handled',
      (WidgetTester tester) async {
    await tester.pumpWidget(StoreProvider(
      store: store,
      child: MaterialApp(
        home: DashBoardView(),
      ),
    ));

    final searchTerm = 'a';

    when(checker.hasConnection).thenAnswer((_) async => true);

    when(enterpriseApi.getEnterprisesWithName(
            name: searchTerm,
            accessToken: accessToken,
            client: client,
            uid: uid))
        .thenAnswer((_) async => HttpResponse(
            simulateApiCallResponse(searchTerm), Response(statusCode: 200)));

    await tester.enterText(find.byType(TextField), searchTerm);

    expect(store.state.searchState, isA<SearchPopulatedState>());
  });
}
