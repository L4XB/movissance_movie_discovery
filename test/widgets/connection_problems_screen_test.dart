import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:mocktail/mocktail.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/cubit/connectivity_cubit.dart';
import 'package:red_line/src/common/widgets/connection_problems_screen.dart';

class MockConnectivityCubit extends Mock implements ConnectivityCubit {}

class MockPersistentTabController extends Mock
    implements PersistentTabController {}

void main() {
  late MockConnectivityCubit mockConnectivityCubit;
  late MockPersistentTabController mockController;

  setUp(() {
    mockConnectivityCubit = MockConnectivityCubit();
    mockController = MockPersistentTabController();
    registerFallbackValue(ConnectivityDisconnected());

    when(() => mockConnectivityCubit.stream)
        .thenAnswer((_) => Stream<ConnectivityState>.empty());
    when(() => mockConnectivityCubit.close()).thenAnswer((_) async {});
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<ConnectivityCubit>(
        create: (_) => mockConnectivityCubit,
        child: ConnectionProblemsScreen(controller: mockController),
      ),
    );
  }

  testWidgets('displays no connection animation', (WidgetTester tester) async {
    when(() => mockConnectivityCubit.state)
        .thenReturn(ConnectivityDisconnected());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(Lottie), findsOneWidget);
    expect(find.text('No Connection'), findsNothing);
  });
}
