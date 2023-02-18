class MountainModel {
  String fileName;
  String displayName;
  String height;
  String location;
  String climbers;
  String type;
  String fact;

  MountainModel(this.fileName, this.displayName, this.height, this.location,
      this.climbers, this.type, this.fact);

  MountainModel.fromJSON(Map<String, dynamic> json)
      : fileName = json['file_name'],
        displayName = json['display_name'],
        height = json['height'],
        location = json['location'],
        climbers = json['climbers'],
        type = json['type'],
        fact = json['fact'];
}
