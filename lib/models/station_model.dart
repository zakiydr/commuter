class StationModel {
  int? status;
  List<StationData>? data;

  StationModel({this.status, this.data});

  StationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <StationData>[];
      json['data'].forEach((v) {
        data!.add(new StationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StationData {
  String? id;
  String? name;
  int? daop;
  int? fgEnable;
  bool? haveSchedule;
  String? updatedAt;

  StationData(
      {this.id,
      this.name,
      this.daop,
      this.fgEnable,
      this.haveSchedule,
      this.updatedAt});

  StationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    daop = json['daop'];
    fgEnable = json['fgEnable'];
    haveSchedule = json['haveSchedule'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['daop'] = this.daop;
    data['fgEnable'] = this.fgEnable;
    data['haveSchedule'] = this.haveSchedule;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
