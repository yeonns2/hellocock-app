class Certification {
  String recieverBirthDay;
  String recieverHP;
  String recieverName;

  Certification({this.recieverBirthDay, this.recieverHP, this.recieverName});

  Certification.fromJson(Map<String, dynamic> json) {
    recieverBirthDay = json['RecieverBirthDay'];
    recieverHP = json['RecieverHP'];
    recieverName = json['RecieverName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RecieverBirthDay'] = this.recieverBirthDay;
    data['RecieverHP'] = this.recieverHP;
    data['RecieverName'] = this.recieverName;
    return data;
  }
}
