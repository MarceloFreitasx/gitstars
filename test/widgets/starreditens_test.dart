import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';
import 'package:gitstars/src/main/widgets/starreditens.widget.dart';

import '../mock/mock.dart';

void main() {
  Future<void> _createWidget(WidgetTester tester) async {
    UserStarsModel data = await Mock().getData();

    await tester.pumpWidget(
      GetMaterialApp(
        home: StarredItens(
          node: data.starredRepositories.nodes[0],
          onClick: () {},
        ),
      ),
    );

    await tester.pump();
  }

  testWidgets("Teste widget: StarredItens", (WidgetTester tester) async {
    await _createWidget(tester);
    expect(find.text("linkedin_login"), findsOneWidget);
    expect(find.text("28"), findsOneWidget);
    expect(find.text("16"), findsOneWidget);
  });
}
