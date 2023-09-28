import 'package:flutter/material.dart';
import 'package:flutter_application_2/Validation/student_validator.dart';
import 'package:flutter_application_2/student.dart';

class StudentEdit extends StatefulWidget{
  Student selectedStudent;
  StudentEdit(this.selectedStudent);
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }

}

class _StudentEditState extends State with StudentValidatorMixin {
 Student selectedStudent;
  var formKey=GlobalKey<FormState>();
  
  _StudentEditState(this.selectedStudent);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci bilgilerini güncelle"),
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
                initialValue: selectedStudent.name,
                decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "Semih"),
                validator: isimKurali,
                onSaved: (newValue) {
                  selectedStudent.name=newValue!;
                },
              );
 }
 
  Widget familyTextBox() {
    return TextFormField(
                initialValue: selectedStudent.family,
                decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "Gül"),
                validator: soyIsimKurali,
                onSaved: (newValue) {
                  selectedStudent.family=newValue!;
                },
              );
  }
  
  Widget gradeTextBox() {
  return  TextFormField(
                initialValue: selectedStudent.grade.toString(),
                decoration: InputDecoration(labelText: "Puan",hintText: "100"),
                validator: puanKurali,
                onSaved: (newValue) {
                  selectedStudent.grade=int.parse(newValue!);
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
                    Text("GÜNCELLE"),
                  ],
                ),
                onPressed:(){
                  if(formKey.currentState!.validate()){
                    formKey.currentState?.save();
                    
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
