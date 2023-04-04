import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/User.dart';
import '../service/AppProvider.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/ServiceSetting.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({Key? key, required this.UserID, required this.reg})
      : super(key: key);

  final int UserID;
  final bool reg;

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  final _formKey = GlobalKey<FormState>();

  late User UserData;
  String Gender = 'male';
  bool _seepass1 = true;
  bool _seepass2 = true;
  bool _chpass = false;
  bool _pressAdd = false;

  TextEditingController _name = TextEditingController();
  TextEditingController _last_name = TextEditingController();
  TextEditingController _birth_date = TextEditingController();
  TextEditingController _phone_number = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm_password = TextEditingController();
  TextEditingController _job = TextEditingController();
  TextEditingController _job_type = TextEditingController();
  TextEditingController _add_village = TextEditingController();
  TextEditingController _add_city = TextEditingController();
  TextEditingController _add_province = TextEditingController();
  TextEditingController _add_detail = TextEditingController();
  TextEditingController _web = TextEditingController();

  // ອັບໂຫລດຮູບພາບ

  String? imageFilePath;
  File? imageFile;

  void getImage() async {
    final picker = ImagePicker();
    var _pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        imageFilePath = _pickedFile.path;
        imageFile = File(_pickedFile.path);
      });
    }
  }

  void GetUserData() {
    List<User> listUser =
        Provider.of<AppProvider>(context, listen: false).ListUser;
    UserData = listUser.firstWhere((i) => i.id == widget.UserID);

    setState(() {
      _name.text = UserData.name;
      _last_name.text = UserData.last_name;
      Gender = UserData.gender;
      _birth_date.text = UserData.birth_day;
      _phone_number.text = UserData.tel;
      _email.text = UserData.email;
      _add_village.text = UserData.add_village;
      _add_city.text = UserData.add_city;
      _add_province.text = UserData.add_province;
      _add_detail.text = UserData.add_detail;
      _web.text = UserData.web;
      _job.text = UserData.job;
      _job_type.text = UserData.job_type;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.UserID != 0) {
      GetUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            //  Padding(
            //   padding: const EdgeInsets.all(12),
            //   child:
            Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        imageFilePath == null
                            ? (widget.UserID == 0)
                                ? CircleAvatar(
                                    child: Icon(
                                      Icons.account_circle,
                                      size: 120,
                                      color: Colors.white,
                                    ),
                                    maxRadius: 65,
                                    backgroundColor:
                                        Color.fromARGB(255, 238, 43, 153),
                                  )
                                : (UserData.image == '')
                                    ? CircleAvatar(
                                        child: Icon(
                                          Icons.account_circle,
                                          size: 120,
                                          color: Colors.white,
                                        ),
                                        maxRadius: 65,
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 43, 153),
                                      )
                                    : CircleAvatar(
                                        // child: Text(UserData.image.toString()),
                                        backgroundImage: NetworkImage(
                                            BaseURL + '/img/' + UserData.image),
                                        maxRadius: 65,
                                      )
                            : CircleAvatar(
                                backgroundImage: FileImage(imageFile!),
                                maxRadius: 65,
                              )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'ຂໍ້ມູນສ່ວນຕົວ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 238, 43, 153)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Wrap(
                        children: [
                          const Text('ຊື່:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ກະລຸນາປ້ອນຊື່...';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ນາມສະກຸນ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _last_name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ກະລຸນາປ້ອນນາມສະກຸນ...';
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'male',
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value!;
                                  });
                                },
                              ),
                              Text('ຊາຍ'),
                              Radio(
                                value: 'female',
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value!;
                                  });
                                },
                              ),
                              Text('ຍິງ'),
                            ],
                          ),
                          const Text('ວັນເດືອນປີເກີດ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _birth_date,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                            onTap: () async {
                              DateTime? pickesate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2102));
                              if (pickesate != null) {
                                setState(() {
                                  _birth_date.text = DateFormat('dd/MM/yyyy')
                                      .format(pickesate);
                                });
                              }
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ອີເມວລ໌:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ເວັບໄຊທ໌:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _web,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ເບີໂທລະສັບ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _phone_number,
                            decoration: InputDecoration(
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10, right: 10),
                                child: Text(
                                  '+856',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black45),
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(
                                left: 0,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ກະລຸນາປ້ອນເບີໂທ...';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ລະຫັດຜ່ານ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            obscureText: _seepass1,
                            controller: _password,
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(8),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _seepass1 = !_seepass1;
                                      });
                                    },
                                    icon: _seepass1
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off)),
                              ),
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                            validator: (value) {
                              if (widget.UserID == 0) {
                                if (value == null || value.isEmpty) {
                                  return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ...';
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ຍືນຍັນລະຫັດຜ່ານ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            obscureText: _seepass2,
                            controller: _confirm_password,
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(8),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _seepass2 = !_seepass2;
                                      });
                                    },
                                    icon: _seepass2
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off)),
                              ),
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                            validator: (value) {
                              if (widget.UserID == 0) {
                                if (value == null || value.isEmpty) {
                                  return 'ກະລຸນາປ້ອນລະຫັດຍືນຍັນ...';
                                }
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'ຂໍ້ມູນອາຊີບ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 238, 43, 153)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Wrap(
                        children: [
                          const Text('ບ່ອນເຮັດວຽກ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _job,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ຕຳແໜ່ງ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _job_type,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'ຂໍ້ມູນທີ່ຢູ່',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 238, 43, 153)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Wrap(
                        children: [
                          const Text('ບ້ານ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _add_village,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ເມືອງ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _add_city,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text('ແຂວງ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _add_province,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ລາຍລະອຽດເພີ່ມເຕີມ:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 238, 43, 153))),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _add_detail,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '.....',
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_chpass)
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'ລະຫັດຜ່ານບໍ່ກົງກັນ ກະລຸນາກວດຄືນ!',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      child: _pressAdd
                          ? const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Color.fromARGB(255, 238, 43, 153)),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (widget.UserID == 0) {
                                    // ການເພີ່ມຂໍ້ມູນໃໝ່ --------------------
                                    if (_password.text ==
                                        _confirm_password.text) {
                                      setState(() {
                                        _chpass = false;
                                        _pressAdd = true;
                                      });

                                      bool result =
                                          await Provider.of<AppProvider>(
                                                  context,
                                                  listen: false)
                                              .AddUser(
                                                  _name.text,
                                                  _last_name.text,
                                                  Gender,
                                                  _phone_number.text,
                                                  _password.text,
                                                  _birth_date.text,
                                                  _add_village.text,
                                                  _add_city.text,
                                                  _add_province.text,
                                                  _add_detail.text,
                                                  _email.text,
                                                  _web.text,
                                                  _job.text,
                                                  _job_type.text,
                                                  imageFile);

                                      var text_mg = Provider.of<AppProvider>(
                                              context,
                                              listen: false)
                                          .loginMessage;

                                      if (result) {
                                        print(widget.reg);
                                        if (widget.reg) {
                                          Navigator.of(context).pop();
                                        }
                                        setState(() {
                                          _pressAdd = false;
                                          Snackbar(text_mg.toString());
                                        });
                                      } else {
                                        setState(() {
                                          _pressAdd = false;
                                          Snackbar(text_mg.toString());
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        _chpass = true;
                                        _pressAdd = false;
                                      });
                                    }
                                    // ຈົບການເພີ່ມຂໍ້ມູນ ------------------
                                  } else {
                                    // ອັບເດດຂໍ້ມູນ ----------------------

                                    if (_password.text == '') {
                                      // ອັບເດດຂໍ້ມູນ
                                      print('press update');
                                      bool result =
                                          await Provider.of<AppProvider>(
                                                  context,
                                                  listen: false)
                                              .UpdateUserEdit(
                                                  widget.UserID,
                                                  _name.text,
                                                  _last_name.text,
                                                  Gender,
                                                  _phone_number.text,
                                                  _password.text,
                                                  _birth_date.text,
                                                  _add_village.text,
                                                  _add_city.text,
                                                  _add_province.text,
                                                  _add_detail.text,
                                                  _email.text,
                                                  _web.text,
                                                  _job.text,
                                                  _job_type.text,
                                                  imageFile);

                                      if (result) {
                                        setState(() {
                                          _pressAdd = false;
                                        });
                                        Snackbar('ອັບເດດຂໍ້ມູນສຳເລັດ!');
                                        // Pop ອອກໄປໜ້າທຳອິດ
                                        Navigator.of(context)
                                            .popUntil((route) => route.isFirst);
                                      } else {
                                        Snackbar(
                                            'ຜິດຜາດ, ອັບເດດຂໍ້ມູນບໍ່ສຳເລັດ!');
                                      }
                                    } else {
                                      // ອັບເດດຂໍ້ມູນ ພ້ອມລະຫັດຜ່ານ

                                      if (_password.text ==
                                          _confirm_password.text) {
                                        setState(() {
                                          _chpass = false;
                                          _pressAdd = false;
                                        });

                                        bool result =
                                            await Provider.of<AppProvider>(
                                                    context,
                                                    listen: false)
                                                .UpdateUserEdit(
                                                    widget.UserID,
                                                    _name.text,
                                                    _last_name.text,
                                                    Gender,
                                                    _phone_number.text,
                                                    _password.text,
                                                    _birth_date.text,
                                                    _add_village.text,
                                                    _add_city.text,
                                                    _add_province.text,
                                                    _add_detail.text,
                                                    _email.text,
                                                    _web.text,
                                                    _job.text,
                                                    _job_type.text,
                                                    imageFile);

                                        if (result) {
                                          setState(() {
                                            _pressAdd = false;
                                          });
                                          Snackbar('ອັບເດດຂໍ້ມູນສຳເລັດ!');
                                          // Pop ອອກໄປໜ້າທຳອິດ
                                          Navigator.of(context).popUntil(
                                              (route) => route.isFirst);
                                        } else {
                                          Snackbar(
                                              'ຜິດຜາດ, ອັບເດດຂໍ້ມູນບໍ່ສຳເລັດ!');
                                        }
                                      }
                                    }

                                    // ຈົບການອັບເດດ ----------------
                                  }
                                }
                              },
                              child: widget.UserID == 0
                                  ? Text(
                                      'ບັນທຶກຂໍ້ມູນ',
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      'ອັບເດດຂໍ້ມູນ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  primary: Color.fromARGB(255, 238, 43, 153)),
                            ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Snackbar(
      String _mg) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(_mg)));
  }
}
