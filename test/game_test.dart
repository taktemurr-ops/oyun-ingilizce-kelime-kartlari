import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ingilizce_kelime_kartlari/oyun_ingilizce_kelime_kartlari.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ingilizceConfig.title.length, 33);
    expect(ingilizceConfig.tagline.length, 33);
    for (final s in ingilizceConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ingilizceConfig.gameId, ingilizceId);
    expect(ingilizceRules.gameId, ingilizceId);
    expect(ingilizceConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ingilizceRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ingilizceId, optionalMechanics: ingilizceRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ingilizceRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
