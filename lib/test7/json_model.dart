import 'dart:convert';

/// name : "flutter"
/// age : 2
/// email : "flutter@example.com"

class User {
  String name;
  int age;
  String email;

  User({this.name, this.age, this.email});

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    User jsonModelBean = User();
    jsonModelBean.name = map['name'];
    jsonModelBean.age = map['age'];
    jsonModelBean.email = map['email'];
    return jsonModelBean;
  }

  Map toJson() => {
        "name": name,
        "age": age,
        "email": email,
      };

  @override
  String toString() {
    return 'User{name: $name, age: $age, email: $email}';
  }
}

class TestJson {
  void test1() {
    String jsonStr =
        "{\"name\":\"laomeng\",\"age\":12,\"email\":\"flutter@example.com\"}";
    var map = json.decode(jsonStr);
    var user = User(name: map['name'], age: map['age'], email: map['email']);
    print('111  $user');
    //方式二
    user = User.fromMap(map);
    print('222  $user');
  }
}
