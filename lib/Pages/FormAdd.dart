import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/AppProvider.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  final _formKey = GlobalKey<FormState>();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 65,
                      ),
                    ],
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
                              if (value == null || value.isEmpty) {
                                return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ...';
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
                              if (value == null || value.isEmpty) {
                                return 'ກະລຸນາປ້ອນລະຫັດຍືນຍັນ...';
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_password.text ==
                                      _confirm_password.text) {
                                    setState(() {
                                      _chpass = false;
                                      _pressAdd = true;
                                    });

                                    Future<bool> result =
                                        Provider.of<AppProvider>(context,
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
                                                _job_type.text);
                                  } else {
                                    setState(() {
                                      _chpass = true;
                                      _pressAdd = false;
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'ບັນທຶກຂໍ້ມູນ',
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
}
