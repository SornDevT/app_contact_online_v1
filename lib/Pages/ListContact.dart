import 'package:flutter/material.dart';

class ListContact extends StatefulWidget {
  const ListContact({super.key});

  @override
  State<ListContact> createState() => _ListContactState();
}

enum SampleItem { user_info, user_edit, user_logout }

class _ListContactState extends State<ListContact> {
  SampleItem? selecteMenu;

  @override
  Widget build(BuildContext context) {
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
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.refresh,
                      color: Color.fromARGB(255, 238, 43, 153),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Expanded(
                child: Container(
                  height: 400,
                  child: ListView(
                    children: [
                      ListContact(),
                      ListContact(),
                      ListContact(),
                      ListContact(),
                      ListContact(),
                      ListContact(),
                      ListContact(),
                      ListContact(),
                      ListContact(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ListContact() {
    return ListTile(
      leading: Icon(Icons.account_balance),
      title: Text('ທ່ານ ສີສົມພອນ '),
      subtitle: Text('ເບີໂທ: 020 112233'),
      trailing: Icon(
        Icons.info,
        size: 40,
        color: Color.fromARGB(255, 238, 43, 153),
      ),
    );
  }
}
