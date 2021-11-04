class profile_main {
  int? isSuccess;
  String? message;
  String? oFLATNO;
  String? oOWNERNAM;
  String? bBUILDNAM;
  String? pROJNAM;

  profile_main(
      {this.isSuccess,
      this.message,
      this.oFLATNO,
      this.oOWNERNAM,
      this.bBUILDNAM,
      this.pROJNAM});

  profile_main.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    oFLATNO = json['OFLAT_NO'];
    oOWNERNAM = json['OOWNER_NAM'];
    bBUILDNAM = json['BBUILD_NAM'];
    pROJNAM = json['PROJNAM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    data['OFLAT_NO'] = this.oFLATNO;
    data['OOWNER_NAM'] = this.oOWNERNAM;
    data['BBUILD_NAM'] = this.bBUILDNAM;
    data['PROJNAM'] = this.pROJNAM;
    return data;
  }
}
