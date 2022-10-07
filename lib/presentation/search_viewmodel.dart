import 'package:devsearch/data/common/common_data.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  var resultData = List.generate(techStackList.length,
      (i) => List.filled(recruitServiceList.length, 0, growable: false),
      growable: false);

  var techStackIndex = 0.obs;

  onNextTechStack() => techStackIndex++;

  var recruitServiceIndex = 0.obs;

  onNextRecruitService() => recruitServiceIndex < recruitServiceList.length - 1
      ? (recruitServiceIndex++)
      : (recruitServiceIndex(0));
}
