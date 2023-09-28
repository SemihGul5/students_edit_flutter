import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/student_add.dart';
import 'package:flutter_application_2/student.dart';

import 'Screens/student_edit.dart';


void main(){
  runApp(MaterialApp(
    home: MyApp()
  ));
}




class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student seciliOgrenci=Student.withID(0,"", "", 0, "");

  List<Student> students=[
  Student.withID(1001,"Engin","Demiroğ",80,"https://upload.wikimedia.org/wikipedia/commons/3/37/Galatasaray_Star_Logo.png"),
  Student.withID(1002,"Kerem","Varış",40,"https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/BesiktasJK-Logo.svg/800px-BesiktasJK-Logo.svg.png"),
  Student.withID(1003,"Halil","Duymaz",20,"https://upload.wikimedia.org/wikipedia/en/thumb/7/7f/FK_%C5%BDalgiris_logo.svg/137px-FK_%C5%BDalgiris_logo.svg.png?20170831055018")];

  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uygulama"),
      ),
    body: buildBody(context),
    );
  }

  Text newMethod() => const Text("İşlem Bilgisi: ");

  String sinavHesapla(int puan){
            String mesaj="";
            if(puan>=50){
              mesaj="Geçti";
            }
            else if(puan>=40){
              mesaj="Bütünlemeye kaldı";
            }
            else{
              mesaj="Kaldı";
            }
            return mesaj;
  }

  void mesajGoster(BuildContext context,String mesaj){
    var alert= AlertDialog(
                title: newMethod(),
                content: Text(mesaj),
              );
              showDialog(context: context, builder: (context) => alert,);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(students[index].avatar),
                    radius:35.0 ,
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(students[index].name+" "+students[index].family),
                  subtitle: Text("Sınavdan aldığı not: "+students[index].grade.toString()+" ["+students[index].getStatus+"]"),
                  trailing: getirIcon(students[index].grade),
                  onTap: (){
                    setState(() {
                      seciliOgrenci=students[index];
                    });
                  },
                );
            })
        ),
        Text("Seçili Öğrenci: "+seciliOgrenci.name+" "+seciliOgrenci.family),

        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: addButton(),
        ),
            Flexible(
              fit: FlexFit.tight, 
              flex: 2,
              child: updateButton(),
        ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: deleteButton(),
        )


          ],
        ),
        
      ],
    );
  }

  Widget getirIcon(int grade) {
            if(grade>=50){
              return const Icon(Icons.done);
            }
            else if(grade>=40){
              return const Icon(Icons.album);
            }
            else{
              return const Icon(Icons.clear);
            }
  }
  
  Widget addButton() {
  return  ElevatedButton(
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
                    Text("Öğrenci Ekle"),
                  ],
                ),
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
              
            } ,
          );
  }
  
  Widget updateButton() {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 93, 94, 97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 2.0,),
                    Text("Güncelle"),
                  ],
                ),
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(seciliOgrenci)));
              
            } ,
          );
  }
  
  Widget deleteButton() {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 203, 136, 36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  
                ),
                child: const Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 2.0,),
                    Text("Sil"),
                  ],
                ),
                onPressed:(){
                  setState(() {
                    students.remove(seciliOgrenci);
                  });
                  var mesaj= "Silindi";
                  mesajGoster(context,mesaj);
              
            } ,
          );
  }
}