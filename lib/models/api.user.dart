part of '../firelamp.dart';

class ApiUser {
  Map<String, dynamic> data;
  String nickname;
  String firstName;
  String lastName;
  String locale;
  String autoLoginYn;
  String autoStatusCheck;
  String plid;
  String agegroup;
  int point;

  String get age {
    if (birthdate == null || birthdate == '') return '0';
    final _yy = int.parse(birthdate.substring(0, 2));
    final _mm = int.parse(birthdate.substring(2, 4));
    final _dd = int.parse(birthdate.substring(4, 6));

    DateTime birthday = DateTime(_yy < 20 ? 2000 + _yy : 1900 + _yy, _mm, _dd);

    DateTime today = DateTime.now();

    AgeDuration _age;

    // Set the age of the user
    _age = Age.dateDifference(fromDate: birthday, toDate: today, includeToDate: false);

    return _age.years.toString();
  }

  String gender;
  String foreign;
  String telcoCd;
  String ci;
  String phoneNo;
  String name;
  String birthday;
  String birthdate;

  int idx;
  String email;
  String userRegistered;
  String sessionId;

  int createdAt;
  int updatedAt;

  /// [mode] is used only when `loginOrRegister` method is being invoked.
  /// It is one of `login` or `register`.
  String mode;
  // String primaryPhotoUrl;
  // String get fullName => name;
  // String dateMethod;
  // String height;
  // String weight;
  // String city;
  // String hobby;
  // String drinking;
  // String smoking;

  int photoIdx;
  String photoUrl;

  ApiUser({
    this.nickname,
    this.firstName,
    this.lastName,
    this.locale,
    this.autoLoginYn,
    this.autoStatusCheck,
    this.plid,
    this.agegroup,
    this.gender,
    this.foreign,
    this.telcoCd,
    this.ci,
    this.phoneNo,
    this.name,
    this.birthday,
    this.birthdate,
    this.idx,
    this.email,
    this.userRegistered,
    this.sessionId,
    this.mode,
    this.photoIdx,
    this.photoUrl,
    this.point,
    this.createdAt,
    this.updatedAt,
  });

  ApiUser.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    data = json;
    nickname = json['nickname'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    locale = json['locale'];
    autoLoginYn = json['autoLoginYn'];
    autoStatusCheck = json['autoStatusCheck'];
    plid = json['plid'];
    agegroup = json['agegroup'];
    gender = json['gender'];
    foreign = json['foreign'];
    telcoCd = json['telcoCd'];
    ci = json['ci'];
    phoneNo = json['phoneNo'];
    name = json['name'];
    birthday = json['birthday'];
    birthdate = json['birthdate'];
    idx = int.parse("${json['idx']}");
    email = json['email'];
    userRegistered = json['user_registered'];
    sessionId = json['sessionId'];
    mode = json['mode'];
    photoIdx = int.parse("${json['photoIdx'] ?? 0}");
    if (photoIdx > 0) {
      photoUrl = Api.instance.thumbnailUrl;
      photoUrl = photoUrl + '?src=$photoIdx&w=100&h=100&f=jpeg&q=95';
    }

    point = json['point'] is int ? json['point'] : int.parse(json['point'] ?? '0');
    createdAt = int.parse("${json['createdAt']}");
    updatedAt = int.parse("${json['updatedAt']}");
  }

  /// ! this data will be saved into cache(GetStorage)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['locale'] = this.locale;
    data['autoLoginYn'] = this.autoLoginYn;
    data['autoStatusCheck'] = this.autoStatusCheck;
    data['plid'] = this.plid;
    data['agegroup'] = this.agegroup;
    data['gender'] = this.gender;
    data['foreign'] = this.foreign;
    data['telcoCd'] = this.telcoCd;
    data['ci'] = this.ci;
    data['phoneNo'] = this.phoneNo;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['birthdate'] = this.birthdate;
    data['idx'] = this.idx;
    data['email'] = this.email;
    data['user_registered'] = this.userRegistered;
    data['sessionId'] = this.sessionId;
    data['mode'] = this.mode;
    data['photoIdx'] = this.photoIdx;
    data['photoUrl'] = this.photoUrl;
    data['point'] = this.point;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;

    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
