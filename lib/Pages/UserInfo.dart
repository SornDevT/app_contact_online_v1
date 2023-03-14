import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 238, 43, 153),
            )),
        title: Text(
          'ຂໍ້ມູນສະມາຊິກ',
          style:
              TextStyle(color: Color.fromARGB(255, 238, 43, 153), fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: PopupMenuButton<SampleItem>(
              offset: const Offset(0, 60),
              initialValue: selecteMenu,
              onSelected: (SampleItem item) {
                print(item);
              },
              child: CircleAvatar(
                maxRadius: 26,
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/219/219986.png'),
              ),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
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
                        style:
                            TextStyle(color: Color.fromARGB(255, 238, 43, 153)),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<SampleItem>(
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
                        style:
                            TextStyle(color: Color.fromARGB(255, 238, 43, 153)),
                      ),
                    ],
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
                              'ສະຖານະ: Admin',
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
                          Text(
                            'ທ່ານ ສີສົມພອນ ໄຊຍະສິນ',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                          ),
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Text(
                            'ວັນເດືອນປີເກີດ: 12/12/1990',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
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
                              'ບ້ານ: ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ເມືອງ: ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ແຂວງ: ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ລາຍລະອຽດເພີ່ມເຕີມ: ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ເບີໂທ: +856',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ອີເມວລ໌: ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ເວັບໄຊທ໌: ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ອາຊີບ: ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ຕຳແໜ່ງ: ',
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
              child: CircleAvatar(
                maxRadius: 55,
                child: Text('Icon'),
              ))
        ],
      ),
    );
  }
}
