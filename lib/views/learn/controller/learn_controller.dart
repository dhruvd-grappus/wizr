import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:wizr/views/learn/model/course_model.dart';

class LearnController extends GetxController {
  RxInt intCompareCourseCount = 0.obs;
  RxList<CourseModel> selectedComparisonList = <CourseModel>[].obs;

  void updateCourseCompare(CourseModel course) {
    if (selectedComparisonList.contains(course)) {
      selectedComparisonList.remove(course);
    } else {
      if (selectedComparisonList.length < 3) {
        selectedComparisonList.add(course);
      } else {
        Fluttertoast.showToast(msg: 'Maximum 3 course can be compared once');
      }
    }
  }
}
