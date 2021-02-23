class CustomControlModel {
  List<Fields> fields;

  CustomControlModel({this.fields});

  CustomControlModel.fromJson(Map<String, dynamic> json) {
    if (json['fields'] != null) {
      fields = [];
      json['fields'].forEach((v) {
        fields.add(new Fields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fields != null) {
      data['fields'] = this.fields.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fields {
  String label;
  String type;
  String field;
  String infoType;
  String id;
  int sortCode;
  String defaultValue;
  String verify;
  String dateformat;

  Fields(
      {this.label,
      this.type,
      this.field,
      this.infoType,
      this.id,
      this.sortCode,
      this.defaultValue,
      this.verify,
      this.dateformat});

  Fields.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    type = json['type'];
    field = json['field'];
    infoType = json['infoType'];
    id = json['id'];
    sortCode = json['sortCode'];
    defaultValue = json['defaultValue'];
    verify = json['verify'];
    dateformat = json['dateformat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['type'] = this.type;
    data['field'] = this.field;
    data['infoType'] = this.infoType;
    data['id'] = this.id;
    data['sortCode'] = this.sortCode;
    data['defaultValue'] = this.defaultValue;
    data['verify'] = this.verify;
    data['dateformat'] = this.dateformat;
    return data;
  }
}
