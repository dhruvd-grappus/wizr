import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:wizr/views/learn/model/course_model.dart';

class LearnController extends GetxController {
  RxInt intCompareCourseCount = 0.obs;
  RxList<CourseModel> selectedComparisionList = <CourseModel>[].obs;

  void updateCourseComare(CourseModel course) {
    if (selectedComparisionList.contains(course)) {
      selectedComparisionList.remove(course);
    } else {
      if (selectedComparisionList.length < 3) {
        selectedComparisionList.add(course);
      } else {
        Fluttertoast.showToast(msg: 'Maximum 3 course can be compared once');
      }
    }
  }
}
