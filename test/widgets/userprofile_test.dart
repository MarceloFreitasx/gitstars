import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';
import 'package:gitstars/src/main/widgets/userprofile.widget.dart';

import '../mock/mock.dart';

void main() {
  Future<void> _createWidget(WidgetTester tester) async {
    UserStarsModel data = await Mock().getData();
    data.avatarUrl = null;

    await tester.pumpWidget(
      GetMaterialApp(
        home: UserProfile(
          user: data,
          showBio: false,
          onShowBio: null,
        ),
      ),
    );

    await tester.pump();
  }

  testWidgets("Teste widget: UserProfile", (WidgetTester tester) async {
    await _createWidget(tester);
    expect(find.text("Marcelo Freitas"), findsOneWidget);
    expect(find.text("marcelofreitasx@gmail.com"), findsOneWidget);
    expect(find.text("Vitória da Conquista, Bahia, Brasil"), findsOneWidget);
  });
}
