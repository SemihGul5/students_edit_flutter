import 'package:flutter/material.dart';
import 'package:flutter_application_2/Validation/student_validator.dart';
import 'package:flutter_application_2/student.dart';

class StudentAdd extends StatefulWidget{
  List<Student> students;
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }

}

class _StudentAddState extends State with StudentValidatorMixin {
  var student = Student.witOutAll();
  var formKey=GlobalKey<FormState>();
  List<Student> students;
  
  _StudentAddState(this.students);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key:formKey,
          child: Column(
            children: [
              nameTextBox(),
              familyTextBox(),
              gradeTextBox(),
              saveButton(),
            ],
          ),
        ),
      ),
    );
  }
  
 Widget nameTextBox() {
  return TextFormField(
                decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "Semih"),
                validator: isimKurali,
                onSaved: (newValue) {
                  student.name=newValue!;
                },
              );
 }
 
  Widget familyTextBox() {
    return TextFormField(
                decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "Gül"),
                validator: soyIsimKurali,
                onSaved: (newValue) {
                  student.family=newValue!;
                },
              );
  }
  
  Widget gradeTextBox() {
  return  TextFormField(
                decoration: InputDecoration(labelText: "Puan",hintText: "100"),
                validator: puanKurali,
                onSaved: (newValue) {
                  student.grade=int.parse(newValue!);
                },
              );
  }
  
  Widget saveButton() {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 2.0,),
                    Text("KAYDET"),
                  ],
                ),
                onPressed:(){
                  if(formKey.currentState!.validate()){
                    formKey.currentState?.save();
                    students.add(student);
                    
                    Navigator.pop(context);
                    mesajGoster(context);
                    
                  }
                  
              
            } ,
          );
  }
  
  void mesajGoster(BuildContext context){
    var alert= AlertDialog(
                title: newMethod(),
                content: Text("İşlem başarılı!"),
              );
              showDialog(context: context, builder: (context) => alert,);
  }
  
  Text newMethod() => const Text("İşlem Bilgisi: ");
}
