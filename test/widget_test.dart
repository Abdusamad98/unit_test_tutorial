import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:unit_test_tutorial/main.dart';
import 'package:unit_test_tutorial/widgets/list_widget.dart';

void main() {
  testWidgets('Test app workflow', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
// Verify that 3 data items exist
// Here we look for 3 ListWidget elements which are the widgets that are // used in the ListView.
    expect(find.byType(ListWidget), findsNWidgets(3));
// Tap the FloatingActionButton
// Here we use a Type Finder to find our item. Works great if there is only // one element of a type present.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
// Verify that a new row has been added
// We again look for 4 ListWidget elements. Furthermore, we look for a
// SnackBar and the matching text that is displayed when a new data item is // added.
    expect(find.byType(ListWidget), findsNWidgets(4));
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text("item 4 added"), findsOneWidget);
// Tap 3rd item in the list
// We use a Key Finder to identify the ListWidget we want to tap. Keys are // always unique and a good way to find the exact widget. The pumpAndSettle // is required because the previous SnackBar auto-dismisses after 1 second // and we need to wait for that to happen.
    await tester.tap(find.byKey(const Key("ListWidget2")));
    await tester.pumpAndSettle(const Duration(milliseconds: 1250));
// Verify shown data is correct
// We look for the SnackBar and a certain text. expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text("item 3 pressed"), findsOneWidget); // Long press 2nd item
// Again a Key Finder and a pumpAndSettle to wait for the previous SnackBar. await tester.longPress(find.byKey(const Key("ListWidget1")));
    await tester.pumpAndSettle(const Duration(milliseconds: 1250));
// Verify pressed item was deleted
// Finding widgets by type, by key, or by text. There are many possibilities. expect(find.byType(ListWidget), findsNWidgets(3));
    expect(find.byKey(const Key("ListWidget0")), findsOneWidget);
    expect(find.byKey(const Key("ListWidget1")), findsOneWidget);
    expect(find.byKey(const Key("ListWidget2")), findsOneWidget);
    // expect(find.byKey(const Key("ListWidget3")), findsOneWidget);
    // expect(find.byType(SnackBar), findsNWidgets(3));
    //expect(find.text("item 2 deleted"), findsOneWidget);
  });
}
