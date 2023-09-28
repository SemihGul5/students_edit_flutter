mixin StudentValidatorMixin {

  String? isimKurali(String? value){ 
    if(value == null || value.length<2) {
      return "İsim 2 karakterden az olamaz";
    }
    return null;
  }

  String? soyIsimKurali(String? value){
  if(value == null || value.length<2) {
      return "İsim 2 karakterden az olamaz";
    }
    return null;
  }

  String? puanKurali(String? value){
    var grade=int.parse(value!);
  if(grade>100||grade<0) {
      return "Puan 0-100 arasında olmalıdır.";
    }
    return null;
  }

}
