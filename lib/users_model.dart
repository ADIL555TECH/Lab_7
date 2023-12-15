class Result {
  String gender;
  Name name;
  String email;
  String phone;
  Picture picture;

  Result({

    required this.gender,

    required this.name,

    required this.email,

    required this.phone,

    required this.picture,

  });
  factory Result.fromJson(Map < String, dynamic> json){
    return Result(gender: json['gender'], name: json['name'], email: json['email'], phone: json['phone'], picture: json['picture']);
  }

}
class Name {

  String title;

  String first;

  String last;

  Name({

    required this.title,

    required this.first,

    required this.last,

  });
  factory Name.fromJson(Map < String, dynamic> json){
    return Name(title: json['title'], first: json['first'], last: json['last']);
  }

}

class Picture {

  String thumbnail;

  Picture({

    required this.thumbnail,

  });
  factory Picture.fromJson(Map < String, dynamic> json){
    return Picture(thumbnail: json['picture']);
  }

}
