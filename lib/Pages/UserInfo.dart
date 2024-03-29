import 'package:app_contacts_online/utils/ServiceSetting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/AppProvider.dart';
import '../model/User.dart';
import 'FormAdd.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key, required this.UserID}) : super(key: key);
  final int UserID;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

enum SampleItem { user_edit, user_logout }

class _UserInfoState extends State<UserInfo> with TickerProviderStateMixin {
  SampleItem? selecteMenu;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    GetUserData();
    _tabController = TabController(length: 3, vsync: this);
  }

  late User UserData;

  void GetUserData() {
    // print(Provider.of<AppProvider>(context, listen: false).ListUser);

    List<User> listUser =
        Provider.of<AppProvider>(context, listen: false).ListUser;
    UserData = listUser.firstWhere((i) => i.id == widget.UserID);
    // print(listUser);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, auth, child) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          leading: auth.user_login.user_type == 'admin'
              ? IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 238, 43, 153),
                  ))
              : null,
          title: Text(
            'ຂໍ້ມູນສະມາຊິກ',
            style: TextStyle(
                color: Color.fromARGB(255, 238, 43, 153), fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: auth.user_login.user_type == 'admin'
                  ? PopupMenuButton<SampleItem>(
                      offset: const Offset(0, 40),
                      initialValue: selecteMenu,
                      onSelected: (SampleItem item) {
                        print(item);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.menu,
                          color: Color.fromARGB(255, 238, 43, 153),
                        ),
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem<SampleItem>(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormAdd(
                                            UserID: UserData.id,
                                            reg: false,
                                          )));
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 238, 43, 153),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ແກ້ໄຂ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 238, 43, 153)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          child: InkWell(
                            onTap: () async {
                              Future<bool> resault = Provider.of<AppProvider>(
                                      context,
                                      listen: false)
                                  .RemoveUser(UserData.id);
                              Navigator.of(context).pop();
                              if (await resault) {
                                Navigator.of(context).pop();
                              }
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 238, 43, 153),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ລຶບ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 238, 43, 153)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => FormAdd(
                  //                     UserID: UserData.id,
                  //                     reg: false,
                  //                   )));
                  //     },
                  //     icon: Icon(
                  //       Icons.edit,
                  //       color: Color.fromARGB(255, 238, 43, 153),
                  //     ))
                  : PopupMenuButton<SampleItem>(
                      offset: const Offset(0, 60),
                      initialValue: selecteMenu,
                      onSelected: (SampleItem item) {
                        print(item);
                      },
                      child: (UserData.image == '')
                          ? CircleAvatar(
                              maxRadius: 26,
                              backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/219/219986.png'),
                            )
                          : CircleAvatar(
                              maxRadius: 26,
                              backgroundImage: NetworkImage(
                                  BaseURL + '/img/' + UserData.image),
                            ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem<SampleItem>(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormAdd(
                                            UserID: UserData.id,
                                            reg: false,
                                          )));
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 238, 43, 153),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ແກ້ໄຂ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 238, 43, 153)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          child: InkWell(
                            onTap: () {
                              Provider.of<AppProvider>(context, listen: false)
                                  .LogOut();
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromARGB(255, 238, 43, 153),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ອອກຈາກລະບົບ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 238, 43, 153)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'ສະຖານະ: ${UserData.user_type}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 238, 43, 153)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            UserData.gender == 'male'
                                ? Text(
                                    'ທ່ານ ${UserData.name} ${UserData.last_name}',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54),
                                  )
                                : Text(
                                    'ທ່ານ ນ ${UserData.name} ${UserData.last_name}',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54),
                                  )
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text(
                              'ວັນເດືອນປີເກີດ: ${UserData.birth_day}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ]),
                          const SizedBox(
                            height: 30,
                          ),
                          TabBar(
                            labelColor: Color.fromARGB(255, 238, 43, 153),
                            labelStyle: TextStyle(fontSize: 16),
                            indicatorColor: Color.fromARGB(255, 238, 43, 153),
                            indicatorWeight: 3,
                            indicatorSize: TabBarIndicatorSize.tab,
                            controller: _tabController,
                            tabs: [
                              Text('ທີ່ຢູ່'),
                              Text('ຕິດຕໍ່'),
                              Text('ອາຊີບ'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
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
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ບ້ານ: ${UserData.add_village}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'ເມືອງ: ${UserData.add_city}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'ແຂວງ: ${UserData.add_province}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'ລາຍລະອຽດເພີ່ມເຕີມ: ${UserData.add_detail}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ເບີໂທ: +856 ${UserData.tel}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'ອີເມວລ໌: ${UserData.email}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'ເວັບໄຊທ໌: ${UserData.web}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ອາຊີບ: ${UserData.job}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'ຕຳແໜ່ງ: ${UserData.job_type}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 20,
                left: 40,
                child: (UserData.image == '')
                    ? CircleAvatar(
                        maxRadius: 55,
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/219/219986.png'),
                      )
                    : CircleAvatar(
                        maxRadius: 55,
                        backgroundImage:
                            NetworkImage(BaseURL + '/img/' + UserData.image),
                      ))
          ],
        ),
      );
    });
  }
}
