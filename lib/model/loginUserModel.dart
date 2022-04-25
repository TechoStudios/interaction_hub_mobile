class loginStudentModel {
  String id;
  String name;
  String userName;
  String courseID;
  String password;
  String role;
  String semester;
  String department;
  String section;

  loginStudentModel(this.id, this.name, this.userName, this.courseID,
      this.password, this.role, this.semester, this.department, this.section);
}

class loginTeacherModel {
  String id;
  String name;
  String userName;
  String semester;
  String password;
  String role;
  String department;

  loginTeacherModel(this.id, this.name, this.userName, this.semester,
      this.password, this.role, this.department);
}
