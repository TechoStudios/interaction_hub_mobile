import 'package:get_storage/get_storage.dart';
import 'package:interaction_hub/model/course_model.dart';
import 'package:interaction_hub/model/feedback_model.dart';
import 'package:interaction_hub/model/loginUserModel.dart';
import 'package:interaction_hub/model/new_model.dart';
import 'package:interaction_hub/model/timetable_model.dart';

import '../model/teacher_model.dart';

class Constants {
  static final box = GetStorage();
  static String login = '';
  static String courseName = '';
  static List<loginStudentModel> loginStudent = [];
  static List<StudentModel> allStudents = [];
  static List<loginTeacherModel> loginTeacher = [];
  static List<newsModel> news = [];
  static List<feedbackModel> feedback = [];
  static List<timetableModel> timetable = [];
  static List<courseModel> courses = [];
  static List<TeacherModel> teacherList = [];

  static String password = '';

  static String username = '';
}
