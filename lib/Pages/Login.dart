import 'package:app_contacts_online/service/AppProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _Phone_number = TextEditingController();
  TextEditingController _Password = TextEditingController();

  bool _seepass = true;
  bool _pressLogin = false;
  bool _ShMg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Color.fromARGB(255, 238, 43, 153),
              height: (MediaQuery.of(context).size.height) / 2,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Padding(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              Text(
                                'ສະບາຍດີ, ຍິນດີຕ້ອນຮັບ',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Color.fromARGB(255, 238, 43, 153)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text('ເບີໂທລະສັບ:',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 238, 43, 153))),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _Phone_number,
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
                        obscureText: _seepass,
                        controller: _Password,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _seepass = !_seepass;
                                  });
                                },
                                icon: _seepass
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
                      _ShMg
                          ? Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Consumer<AppProvider>(
                                  builder: (context, auth, child) {
                                return Text(
                                  auth.messages_check_login.toString(),
                                  style: TextStyle(color: Colors.red),
                                );
                              }),
                            )
                          : SizedBox(
                              height: 80,
                            ),
                      SizedBox(
                        width: double.infinity,
                        child: _pressLogin
                            ? const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Color.fromARGB(255, 238, 43, 153)),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // print('Form Ok');

                                    setState(() {
                                      _pressLogin = true;
                                    });

                                    bool result = await Provider.of<
                                            AppProvider>(context, listen: false)
                                        .LoginAuth(
                                            _Phone_number.text, _Password.text);

                                    if (result) {
                                      print('Login OK!');
                                    } else {
                                      setState(() {
                                        _ShMg = true;
                                        _pressLogin = false;
                                      });
                                      print(_pressLogin);
                                      print('No login!');
                                    }
                                  }
                                },
                                child: Text(
                                  'ເຂົ້າສູ່ລະບົບ',
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
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'ບໍ່ມີບັນຊີ, ລົງທະບຽນ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
