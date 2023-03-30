import 'package:app_contacts_online/service/AppProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserInfo.dart';

class ListContact extends StatefulWidget {
  const ListContact({super.key});

  @override
  State<ListContact> createState() => _ListContactState();
}

enum SampleItem { user_info, user_edit, user_logout }

class _ListContactState extends State<ListContact> {
  SampleItem? selecteMenu;

  @override
  void initState() {
    super.initState();
    GetAllUser();
  }

  void GetAllUser() async {
    Provider.of<AppProvider>(context, listen: false).GetAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, Auth, child) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ລະບົບສະມາຊິກ ອອນໄລທ໌',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 238, 43, 153)),
                      ),
                    ),
                    PopupMenuButton<SampleItem>(
                      offset: const Offset(0, 60),
                      initialValue: selecteMenu,
                      onSelected: (value) {},
                      child: CircleAvatar(
                        maxRadius: 26,
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/219/219986.png'),
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem<SampleItem>(
                          child: InkWell(
                            onTap: () {
                              // print('ok');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserInfo(
                                    UserID: Auth.user_login.id,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.info,
                                  color: Color.fromARGB(255, 238, 43, 153),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ເບີ່ງຂໍ້ມູນ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 238, 43, 153)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  onChanged: (value) {
                    Provider.of<AppProvider>(context, listen: false)
                        .SearchContact(value);
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 10,
                          right: 0,
                        ),
                        child: Icon(
                          Icons.search,
                          size: 35,
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
                      hintText: 'ຄົ້ນຫາຂໍ້ມູນ...'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ລາຍການ ສະມາຊິກ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 238, 43, 153)),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<AppProvider>(context, listen: false)
                            .GetAllUser();
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: Color.fromARGB(255, 238, 43, 153),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(12),
              //   child:
              Expanded(
                child: Container(
                  child: ListView.builder(
                    padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                    itemCount: Auth.ListUserSearch.length,
                    itemBuilder: (context, index) {
                      return ListContact(
                        Auth.ListUserSearch[index].name,
                        Auth.ListUserSearch[index].tel,
                        Auth.ListUserSearch[index].id,
                      );
                    },
                  ),
                ),
              ),
              // )
            ],
          ),
        ),
      );
    });
  }

  Widget ListContact(String title, String subtext, int UserID) {
    return ListTile(
      leading: Icon(Icons.account_balance),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtext),
          // Text(
          //   'ທີ່ຢູ່: ບ້ານ, ເມືອງ, ແຂວງ',
          //   style: TextStyle(fontSize: 12),
          // ),
        ],
      ),
      trailing: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserInfo(
                UserID: UserID,
              ),
            ),
          );
        },
        child: Icon(
          Icons.info,
          size: 40,
          color: Color.fromARGB(255, 238, 43, 153),
        ),
      ),
    );
  }
}
