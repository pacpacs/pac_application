class UserModel {
  String id;
  String nickName;
  String password;
  String profileImgPath;

  UserModel({this.id, this.nickName, this.password, this.profileImgPath});

  Future getImageUrl() async {
    // Null check so our app isn't doing extra work.
    // If there's already an image, we don't need to get one.
    if (profileImgPath != null) {
      return;
    }
  }

  factory UserModel.fromJson(Map<String,dynamic> json) {
      return UserModel(
        id: json['userId'],
        nickName:json['nickName'],
        profileImgPath: json['imgPath']
      );
  }
}
