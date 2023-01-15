import 'package:flutter/material.dart';
import 'package:notebook/pages/drawer_page.dart';
import 'package:notebook/util/util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> bookList = [];

  @override
  void initState() {
    super.initState();

    bookList = [
      {'title':'Facebook', 'content':'My Password: 123456', 'date':'15-01-2023'},
      {'title':'Twitter', 'content':'My username: abc', 'date':'12-01-2023'},
      {'title':'Instagram', 'content':'My instaname: xyz', 'date':'11-01-2023'},
      {'title':'Telegram', 'content':'My telename: pqr', 'date':'10-01-2023'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Note Book',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      drawer: const DrawerPage(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu_book,
                  size: 40,
                ),
                Text('Hello Palash'),
                Text(Util.greeting()),
              ],
            ),
            Container(
              height: 55,
              margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search bt Title...',
                  filled: true,
                  fillColor: Colors.grey.shade400,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index){
                  return SizedBox(
                    height: 8.0,
                  );
                } ,
                itemCount: bookList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bookList[index]['title'],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    bookList[index]['content'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    bookList[index]['date'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              PopupMenuButton<String>(
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuEntry<String>>[
                                    PopupMenuItem(
                                      value: 'key_edit',
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text('Edit'),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 'key_delete',
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete_forever),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text('Delete'),
                                        ],
                                      ),
                                    ),
                                  ];
                                },
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.more_vert),
                                onSelected: (String value) {
                                  if(value == 'key_edit'){
                                    //Do Edit
                                  } else if(value == 'key_delete'){
                                    //Do Delete
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
