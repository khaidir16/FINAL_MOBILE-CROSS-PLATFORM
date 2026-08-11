import 'package:edutech_smk/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EduTech foundation renders key project status', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const EduTechApp());
    await tester.pumpAndSettle();

    expect(find.text('EduTech SMK'), findsOneWidget);
    expect(find.text('Fondasi proyek siap'), findsOneWidget);
    expect(find.text('Siswa'), findsOneWidget);
    expect(find.text('Guru Mapel'), findsOneWidget);
    expect(find.text('Wali Kelas'), findsOneWidget);
    expect(find.text('Guru BK'), findsOneWidget);
    expect(find.text('Berikutnya: integrasi backend Firebase'), findsOneWidget);
  });
}
