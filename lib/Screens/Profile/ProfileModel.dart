class ProfileModel {
  String? id;
  String? name;
  String? email;
  List<int>? profileImage;
  ProfileModel({this.name, this.id, this.profileImage, this.email});

  //todo : implement savedItems LikedItems Orders Posts Following Follower

  ProfileModel.fromJson(Map<String, dynamic> json) {
    var user = json["user"];
    id = user["_id"];
    name = user["name"];
    email = user["email"];
    profileImage = user["profile"]["data"].cast<int>();
  }
}
