class ScheduleModel {
  int? status;
  List<ScheduleData>? data;

  ScheduleModel({this.status, this.data});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ScheduleData>[];
      json['data'].forEach((v) {
        data!.add(new ScheduleData.fromJson(v)); 
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

class ScheduleData {
  String? id;
  String? stationId;
  String? trainId;
  String? line;
  String? route;
  String? color;
  String? destination;
  String? timeEstimated;
  String? destinationTime;
  String? updatedAt;

  ScheduleData(
      {this.id,
      this.stationId,
      this.trainId,
      this.line,
      this.route,
      this.color,
      this.destination,
      this.timeEstimated,
      this.destinationTime,
      this.updatedAt});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['stationId'];
    trainId = json['trainId'];
    line = json['line'];
    route = json['route'];
    color = json['color'];
    destination = json['destination'];
    timeEstimated = json['timeEstimated'];
    destinationTime = json['destinationTime'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stationId'] = this.stationId;
    data['trainId'] = this.trainId;
    data['line'] = this.line;
    data['route'] = this.route;
    data['color'] = this.color;
    data['destination'] = this.destination;
    data['timeEstimated'] = this.timeEstimated;
    data['destinationTime'] = this.destinationTime;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
