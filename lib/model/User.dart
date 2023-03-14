import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String last_name;
  String gender;
  String image;
  String tel;
  String password;
  String birth_day;
  String add_village;
  String add_city;
  String add_province;
  String add_detail;
  String email;
  String web;
  String job;
  String job_type;
  String user_type;

  User({
    required this.id,
    required this.name,
    required this.last_name,
    required this.gender,
    required this.image,
    required this.tel,
    required this.password,
    required this.birth_day,
    required this.add_village,
    required this.add_city,
    required this.add_province,
    required this.add_detail,
    required this.email,
    required this.web,
    required this.job,
    required this.job_type,
    required this.user_type,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        last_name = json['last_name'],
        gender = json['gender'],
        image = json['image'],
        tel = json['tel'],
        password = json['password'],
        birth_day = json['birth_day'],
        add_village = json['add_village'],
        add_city = json['add_city'],
        add_province = json['add_province'],
        add_detail = json['add_detail'],
        email = json['email'],
        web = json['web'],
        job = json['job'],
        job_type = json['job_type'],
        user_type = json['user_type'];
}
