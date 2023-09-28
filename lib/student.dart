class Student{
  int? id;
  String name;
  String family;
  int grade;
  String? status;
  String avatar;
  
  Student(this.name,this.family,this.grade,this.avatar);
  Student.withID(this.id,this.name,this.family,this.grade,this.avatar);

  factory Student.witOutAll() {
    return Student("", "", 0, "");
  }
  String get getName{
    return " OGR - $name";
  }
  void set setName(String value){
    name=value;
  }
  
  String get getStatus{
     String mesaj="";
            if(grade>=50){
              mesaj="Geçti";
            }
            else if(grade>=40){
              mesaj="Bütünlemeye kaldı";
            }
            else{
              mesaj="Kaldı";
            }
            return mesaj;
  }

}